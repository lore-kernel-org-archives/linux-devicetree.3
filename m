Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696284;
	b=2laOR9rWkDT6x9HlUHzM8yl63Dopx9rDuDq50/3RCuL/K9vILJjazO2zANxJWcSfU0x8
	 vNaKlwnBeug8bLjztx4bmX7jaRdguUpn6Dbx04S7ezmiTJp03viTuqm26xsN5jzQB6b62
	 ymrJ8Z9PD3u3oDX5BNMrcwS/10K7Z864mkC5/N3iH/EO5njaPvguW7D71LRb+V2Ve2+uC
	 T2sTa9DoVN71XtNXkvqObt3kWgPOp/886icfic9DS1BL72SNM9juDKmjZ8Ti4fs2CWu9V
	 iwAhHgYUELhqx6VssPCYlms+yuVrySGPGLDlJhH4JoOsPiAqRC9S1iVb1Ps81ix1tag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696284;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jZPQLLdSKDr70Ex6sF8g1B7/IBeWUUwY5iPE3L01UtA=;
	b=LYQXKfcBXDmyowk5hLxlyvyrp7LAZyGdBOr/zWlD9qLAicOcgovzS5IkkRaxUaCPlwiE
	 7iIEnpcYJOUnAXO94N5/bNAHwsW6RrzWHwplVDS4vX6eo3N3+zjqdhAyW8rFZucjnwby8
	 uS/IGQef5i4jkH5Uq24FEuAg4JDaBD12YoJxAO0YqBg94QjBbv751DilYyiDXtVsYgCMW
	 3sh1XzQJwqaBC7bTwjoBH0+q8wr2Budft2BNWn00x4b9kb3DKHrmQ7PU8bQ6auqQye6g9
	 iqEa6znhE+OyWltmxFg7sAPu9emCdFeGoiMKN7XQ8Q8vuVDNZwMlbroSLOt9p2At2uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Z37F/eph";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cxs44wNC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FAA606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89FAA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z37F/eph;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cxs44wNC
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVNVl3893643
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jZPQLLdSKDr70Ex6sF8g1B7/IBeWUUwY5iPE3L01UtA=; b=Z37F/ephUwpXH83D
	PdMuxOfAqwIpAe/YlnbUZ8ljayC8BKQSvv3A/cvyHEZto99TpsE8JVJVO4jxlrsF
	j15/doXvijMgVBNOdQEeCCWZzYoWdTh0VqYQ/QM/WxEhZ8GjwQlWMkb0OwP7lgN2
	E2mlXKgim8VW/XMg0aKct7YwwQQb7I7mAK9mcdG1XWlvosE9OmM0Wqm2xCjd/+zz
	FMe0DaQN+7mizbEHcmuxNnDIBC1NWAvJiqsgIitiveKsFIK9El4XqZo092Krt/Z7
	JWEO9KVogU93hlCdNqV4Puj1eRZ0M+rmALCp496gtK3hrEuCqcM8RfThDjbrvRYQ
	K+o1Fg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm80tb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:31:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-313c7315becso607543eec.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 04:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795696281; x=1796301081; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jZPQLLdSKDr70Ex6sF8g1B7/IBeWUUwY5iPE3L01UtA=;
        b=cxs44wNCy5t3DWqNy5rBn/EbdwhIRt01eJYekLN0kvH/nOXF9dWmHP4IddF86wK700
         g/GEb+J0T8PlOyR3ZGc/2FDmt35wQW126gNdV5APGeXEtfV+a6btvXoGXN/9RUxqzblz
         qHCL0Q2ZNUXrTDTMa4REONqWxolSsyU2ycuJvZ852dVquuSklE2xSo0w7XUoiLRyAUP8
         i1hra5V8U01RblfU+7cvQ1rdkNuokLX/6KELoB9b8g2VceEK9hye92dHcsHe3Y6vsMdw
         ia44emVprIrshR0G2OpBUls93vhxvjxQ5wCkbCWIP6wiuva9wJB5hbdjwSMB95OoW/9f
         Zu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795696281; x=1796301081;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jZPQLLdSKDr70Ex6sF8g1B7/IBeWUUwY5iPE3L01UtA=;
        b=ROEwjv6E6zi+RsHQ1kIlPTmUvh5eyFzB19hQDZWtK1FvPxacaimw69BbBz0m9+FloT
         Rp4lEJFMNUYI3YuD21gFsR6HUa/NBLRl8weQtZXt2Ui+19glM85+f1+HuF2SpY4zk7Yu
         8xAdGTJKMP9WvEf8hywEM/LLhqnXNDa1Bqq8Npn8FnUIrtBX/QgFm+DuTWEYMNJ4eU5U
         cKbuNZBZb9fyESP+V3AYyIbqd956phLPd/GDP/gTxZ/yQ4bTaEKfkk+PT2YREQUrJVvN
         Wq5PaKVtqyeLBGVG+nbyq/ZXu5FIL4mrTS7vj2JEGs5SQhcyQQqO2lPc49zaq978hYBf
         8iVw==
X-Gm-Message-State: APuU4Z+GXINqMrPjn1rhjyhLG2HRyOi36jYznQZLrMyyiEE84xamLLp3
	RGwU4py6Ulz/UbDVO1a9pKx9U3pAbrPHYfRImgQYzCnMJq6S4f2CjusKtrw5LZpd57vmHKc8gHu
	yQ0Gcr/MdpevA7sUJ+hZE8ywwVDoo85P4lVUCPYsW22yfYPyEjROy0wP/WfUcEvJU
X-Gm-Gg: AZFdTZcPgIorWvIsrFkvCxuAWH14vwvXmrTThS0F8zaCxfdZSLf1zX7hlU6y4tnsWzR
	lU6pAFrOfE/6xIig5yikMPYxY8V/sxuQ55Z/yQaytj10keeB9L0dQuxknpmvtk5tQ2t0qAUgPzc
	xzMEHFb6oAoKWYdUaS2hjldy71nTii6shUR6nHlkX4boaUt8G3m8WQ/S94n69a6moV8c48D/8UA
	R0NuAXb9tahVZu2AinUQ+w0i7b3xb99+we7/xnolt15NdmUAbUIngmAN0l1amNflBrjc6zd/XPX
	E+f59oErT4gk8fN0yTwXnuetWIo5RqcYTchOKQ2Wr+VBINXeYLzWbOBBtKDD+Ayyb1YMMY9HHdG
	w4cDh+WSZEAZgiapbFU8WjdPloMi47mC4gvexZM96i1YIk8I2z7DBj/fIENDA5rZ4YmpV3U9w/s
	p7MW3jfq15G0GlFrG5CEJtt21y3ScB8JB9FiLnXYjR5dbFpQhg+uGfj6RnopbC1gLP6qyB1G+Di
	7etxJk1IpsQP3pT4JGgk9KkD/gS
X-Received: by 2002:a05:7300:1c24:b0:384:a0cb:a6d0 with SMTP id 5a478bee46e88-3856de58f7fmr34445198eec.1.1795696281143;
        Thu, 26 Nov 2026 04:31:21 -0800 (PST)
X-Received: by 2002:a05:7300:1c24:b0:384:a0cb:a6d0 with SMTP id 5a478bee46e88-3856de58f7fmr34445156eec.1.1795696280483;
        Thu, 26 Nov 2026 04:31:20 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm70375739eec.21.2026.11.26.04.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:31:19 -0800 (PST)
Date: Thu, 26 Nov 2026 18:01:15 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza-evk: Enable DisplayPort over USB
 Type-C
Message-ID: <awgmk6fPb7piWGs+@hu-vishsain-blr.qualcomm.com>
References: <20261125-eliza_evk_display-v1-1-78a56df97a26@oss.qualcomm.com>
 <sashiko-outbox-232960@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-232960@kernel.org>
X-Proofpoint-ORIG-GUID: cd8n8pWxJIoo_Z2XgVrshqNEWZTHdm5D
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0OCBTYWx0ZWRfXzqROxDR4X8id
 rls6FJWd3HyGXwpxMlVzvEOevPNjCjSFzyswSV6d2iHt/BK2xZQPIIQiUJZzts99EgLS8Io+8rk
 tr/n+aycUSTK4AM3ZOHdwMhfboOiP2M=
X-Proofpoint-GUID: cd8n8pWxJIoo_Z2XgVrshqNEWZTHdm5D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0OCBTYWx0ZWRfX9ZNlHXIJiLrR
 VnBhZDf5kKTToPjYTkaQQc3XAZHLallW7GD8loRCviCA+/K09Ii0/d7g39NWMsxU+OLsAYjqDC7
 59uO6JDE3aiItXAADLNRIqaEszWH5EMOb6OSMLIzkjN4Q8g/srKxkzQtyR6JIWM3qie+nAR3lv8
 lgRN0XqRuwWysdnckHouWGWmz6XpkyZ365mxH95Ov5aiwgiN6jcpniE+4wCNlGIt1g4X8Ir3kGp
 na4jC6R1CEvdHb+5fqFsKRpfswG31DuziI2oQTn2udfdTXOW+tLIwhgJc4xoGs/EFwoAYgJ+Q0Y
 RALXgbGti9XdQ+0E/HeJs4euFvuLveaGNw1U3xLsMCXTDaKK+4Ni2Tk3yf0P3TCxcNdSknDyvby
 nyERyVyCAylAsd8ndCpeOsPWhQEP0dkPoknJK1pprWADoFYsvcIo5c3VC57TRW2V7/8ceY/Ghsg
 yGsKCQpY+VM2NVHFScg==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b08269a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Fg7rGGv9YvjlHdKCETkA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260048

On Wed, Nov 25, 2026 at 08:57:13AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] usb: typec: gpio-sbu-mux: vcc-supply not enabled in
>   gpio_sbu_mux_probe()
> --
> 
> commit af0d0775b3f67c8bf2ee5b677ffafbfe4186fe02
> Author: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> 
> arm64: dts: qcom: eliza-evk: Enable DisplayPort over USB Type-C
> 
> This commit enables MDSS and DP0 on the Eliza EVK and describes the
> onsemi FSUSB43L10X SBU mux and its pmic_glink connector endpoint for
> DisplayPort over USB Type-C.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
> > index 02e58a4bc91d4..8c663ef6718d2 100644
> > --- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
> > @@ -61,6 +61,35 @@ pmic_glink_ss_in: endpoint {
> >  						remote-endpoint = <&usb_dp_qmpphy_out>;
> >  					};
> >  				};
> > +
> > +				port@2 {
> > +					reg = <2>;
> > +
> > +					pmic_glink_sbu: endpoint {
> > +						remote-endpoint = <&sbu_mux_in>;
> > +					};
> > +				};
> > +			};
> > +		};
> > +	};
> > +
> > +	sbu_mux: sbu-mux {
> > +		compatible = "onnn,fsusb43l10x", "gpio-sbu-mux";
> > +
> > +		enable-gpios = <&tlmm 177 GPIO_ACTIVE_LOW>;
> > +		select-gpios = <&tlmm 178 GPIO_ACTIVE_HIGH>;
> > +
> > +		vcc-supply = <&vreg_l17b>;
> 
> [Severity: Medium]
> Will vreg_l17b stay powered for sbu_mux when the eUSB2 repeater is not
> active?
> 
> gpio_sbu_mux_probe() in drivers/usb/typec/mux/gpio-sbu-mux.c only acquires
> enable-gpios and select-gpios and never requests or enables vcc-supply.
> Because vreg_l17b is not marked regulator-always-on in
> eliza-cqs-som.dtsi, its only active consumer is pm7550ba_eusb2_repeater;
> if usb_hsphy exits via eusb2_repeater_exit(), vreg_l17b is disabled and
> the FSUSB43L10X SBU mux loses power, breaking DisplayPort AUX.
Thanks for the review. As per the Eliza EVK schematic, the FSUSB43L10X VCC (FSUSB_VCC) is tied to
VREG_L17B_3P104 so vcc-supply = <&vreg_l17b> accurately describes the hardware. You're right that
gpio_sbu_mux_probe() doesn't acquire or enable vcc-supply, so the rail is not held by this consumer and could be disabled
when the eUSB2 repeater releases it. That is a limitation of the gpio-sbu-mux driver, not of this DTS patch. I'll address
it separately from driver to enable its optional vcc-supply. The DTS description stays as is.
I will add this in v2 in another commit, Bindings already defined this as optional, let me know otherwise or
if this needs to go in a different tree.
 
+       ret = devm_regulator_get_enable_optional(dev, "vcc");
+       if (ret)
+               return dev_err_probe(dev, ret, "failed to enable vcc supply\n");
 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261125-eliza_evk_display-v1-1-78a56df97a26@oss.qualcomm.com?part=1
