Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793694532;
	b=r8tp6igzK4l+Vyq881xpyMgQTIcaQ9r5xBzHp7zOzPNG3fmtJ0DP0tIqco691O9yz7jH
	 U+h11aiGNDhaxTik6/9yufZ61TT2sE5P7wdR9ym8B1/xcDIF/vsm2D6Cz0A+7DhpM42fn
	 RntNreyfmCd701HQWHpV0V9sLCCK00dz8VU4UwUOevm+OTk0tNV0grhwzl7vRm5d+WTNJ
	 XgMHrxYetby5vrY5oysswc9sna/cDvzjVTerbMBGvgEmcIPMbAnUA239yz2sqDAzks1Ss
	 IhFmBaFRn8Duu7ZXwzrhF8z4wALVDCL2w38C8tLUeRo91UfQRzuEnbm9r1phpHV4cmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694532;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zQxjtoAdJVW9VrBT+0USiYDSKO2Od7kw4WdhAnenrWA=;
	b=CZrH6cizQAGKXAX+WSmSpM3pyF2KMWlRwXQLVm/R8Bgf57fObt/syCEcWxICKuoWJssL
	 BD2Anrjwyj/r8zrXS8UiZBwEvlZ8GezDojb55pp+hOgD+1ULFsiQ7PKQctQGrmN347Vy6
	 MdVscBzd/gs76pEgDgkWcWyTIpCmKRlHGsJLi9/rUZMAA/yJQQ4yCUwF/mLxEOQJbotKS
	 n/L+HtxG7U76P4wEwY4xIJNXSdiNcsuYdT/csly+nCCCygXngQKh/B34L/id7ohPyZR/X
	 3KSqvP6ZftRo62rFKVmyxovWdQWURrmZ5E+78vQ5mR4TzUDQ1DNRXHsoASxBZ8it4UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BO+tkU3u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J7Ub3+xa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494E3606A33D
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 08:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 494E3606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BO+tkU3u;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J7Ub3+xa
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A38DohE1477061
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 08:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zQxjtoAdJVW9VrBT+0USiYDS
	KO2Od7kw4WdhAnenrWA=; b=BO+tkU3usRuyU6yvbXf7k3jwlyHaouXFsXL5VSUr
	Z1lqxhnwxxqvOlcG/W1LFlXyf+dUdSxD6DMN4QL6OAHKUW2mYs5FtSBgORFncZaU
	0RUg0Od3C9vnPEDlNrI2+gwbagVPpkxTCIEKdZxJ89yIo69qSgPLBLLi+M04+/zL
	CluHAAxyZSTatfhUuKoXcUiEPL2y3iMyiXud2BasSx9EusPt9Qpn7hppDtxRmQDr
	iMWdzoWqbZFHbq6K+PJy1mJDy5fM5rhfLRucAb1ft9whw3uKLRGh2BT+1aJlAIfr
	eepNXOVTYGwsBo1vYRlS2bkSFXkOLbfIGjUf18DgcHXzmQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5hp42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 08:28:50 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a190c53a3so782661eec.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 00:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793694530; x=1794299330; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zQxjtoAdJVW9VrBT+0USiYDSKO2Od7kw4WdhAnenrWA=;
        b=J7Ub3+xa1oC2VDe2kr7F2feO/wQgpVwpskjmlgIUTi8a9vZ2s7UWmBvma9HS/iInbu
         1ek9GyTTRoJj2wO9NpYYv/TZ9JoUw0CNqrs6dCKtY/JKM/uMW/LeT9yiXpC+YLAcbEyz
         39RCydVal+rf65KWVmL/NN0Z8j+/twGqiJVqptBdw4/T2rP6PewMovZawSM94PBnrq/A
         /FvDWsGKek3z94XXyWzg/zaFHUFzhqRNLNF1awk9JP1S/awCL3DmJORTdwY6GyXMVLMT
         Ge6U6BTfSRJ1xca1vfH+RGQHSNqb8c+lIgPj2V72ntdJ2G8PqJuT5mhiPapF7ujpkQ82
         EfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694530; x=1794299330;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQxjtoAdJVW9VrBT+0USiYDSKO2Od7kw4WdhAnenrWA=;
        b=Xe4fl2yi5xAT1bGP4JsCtQM5duYnMKiywsK0KzT6P6XV03vuX7LQ3Fn6GH1Sk5ogEW
         ax8F7gVnV+DYoBkzQCtNc4wfTh3tqInILtT4iTvuRDBfj0C9ZFI/BWOzyvrgP5hwiuRI
         k1AdDdfT90NPn3LvDND5xPSI7JNeVR4PBreYKgv0aty+1xXcOy2aFLvkk5+yDllInftk
         zUIqETv+aXQWH+cklNz3Pm809E+B/MjQZSWWPHtqA6xEU/BBUJ8Hxea2IkwxrJ6f3Rxo
         brGnnKkwdFq5OBaUm7ECqR/tCHzZk+DT1W5grfHaFk2cOX1Mtzg0PZT/ta/SIQZ8pA/q
         qROw==
X-Forwarded-Encrypted: i=1; AKwUvBwUHCT2Bc0eozr46ibDb1hGshRmlRV8CeXIpozROrYz3giCDW0zFxC18weMYOXAU7vRvoIPLwlbodZ6@vger.kernel.org
X-Gm-Message-State: APuU4Z/0tv8ZKLW6YeDaO47r4kj8r6KKT1PCwrZezQ291oDZ2f318voy
	06RS3EIsuyShN5lfnHN87aZ3g15ebb5Xv7hLwz7B6X8hj7XZaUHv9Fv6OqtZdqDBN5dJJ9lGlsS
	S4GmM2fYMhq5OAhYoFPo/uWGuplaKyPSBswPCeXeQ7k0bfbgFrc4u9SivXw1wAj+X
X-Gm-Gg: AYBFou1QbOcXsIMfn+ayFQ1JkwpyTdZOivIljN/cuwJ04rvG3nIM2JqI+jRutXIXuX/
	KS2PPcyAQy9BDMy7Az9QAyzJsoZQcLC6NpEquLZftvKMkiUpufLUIo3JvZ0fEf/NnCUFCc12VJk
	cRhaHlOQFlMIj/q8gWm0ONUAypkIxFh4mjmvHNKwOYMyRJwBnrIpGlMq79RtB3gu2SpK6UwcOAK
	cp9r91VHBe9594Sf/5YQQRjSZNOKO1srmaFd0avVy62648ybmc8wuh/717IOI7lEGb8I0cgElrR
	9bN2iE+WlT4VSahl6ZSfG5UP6NxHlOxInohbnTUbHGjJCeqxDJdCeYciJ3Nl35leNyOmMyvyKo0
	qbWnbD4iKD4/Cjwkkj6sUylmTWhE9HLpeYIwPFEsVMOjwsyNCjFff/FhaIMZxrly+69+L8WKVX8
	h2n3k3TqHfV9qbsA==
X-Received: by 2002:a05:7300:3b05:b0:369:fe82:8d3f with SMTP id 5a478bee46e88-36a3002ef31mr31205469eec.14.1793694529736;
        Tue, 03 Nov 2026 00:28:49 -0800 (PST)
X-Received: by 2002:a05:7300:3b05:b0:369:fe82:8d3f with SMTP id 5a478bee46e88-36a3002ef31mr31205412eec.14.1793694529009;
        Tue, 03 Nov 2026 00:28:49 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm51976074eec.15.2026.11.03.00.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:28:48 -0800 (PST)
Date: Tue, 3 Nov 2026 16:28:42 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
Subject: Re: [PATCH RFC] arm64: dts: qcom: nord: add ADC-TM thermistor
 channels for Nord PMICs
Message-ID: <aumbOqMXf-uWmGOx@QCOM-aGQu4IUr3Y>
References: <20261028150103.520428-1-shengchao.guo@oss.qualcomm.com>
 <6drdycuoo4n4qssp3axrij5xrftvg6w24z4oa5xw6wmtayknk2@mwz62l7bnvhg>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6drdycuoo4n4qssp3axrij5xrftvg6w24z4oa5xw6wmtayknk2@mwz62l7bnvhg>
X-Proofpoint-ORIG-GUID: 58OpmfJ_TyUFqXS6K_lGA9vGGQHahwv7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzMyBTYWx0ZWRfX62oKg6NBWRLG
 aEIMm1ihXZJlScAUykRf9oOWqG26sFEn1mCGUh25PaD29L/3oJ/MxDilG8s+oG+3xOhCMBzNLSd
 LsfPP9tR8ljBZQI5dqoaF3o/qh8dV+WAqB3jn2IUZT8McVSYvLttq+JCz3VxCWHDizW7ESv+Izb
 B9RuzuovY2d8Nk8D1w2kXZmDQ5XH2BZu7BL9xUS1o5Mgj45S5G+2VlEFpjt+vHjuQu54cg0vTkJ
 iejLRqv4RjxNabBI3D3T4WfyGo9DimiCfKC2cFjOsvi8sSxIBFrU12g0KmLmZXAdzmPpGae8RaG
 4PWb9JWfAWIvLg9tVNQ32F9ibZ8BKJvARc8jOwmf4F3iT5qTiFbw2rSKXFQgLtXKADy9jGVrEzG
 m13m4G/vDgbQeEHQySUdOTm4SEKvMytf25ZbaS2KeNSLxIZw0eNIYDEcnldUpSHoe/PsVLQQ1qW
 R4Tk4TXK8qnt+Sutgow==
X-Proofpoint-GUID: 58OpmfJ_TyUFqXS6K_lGA9vGGQHahwv7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzMyBTYWx0ZWRfX/ZN+e7OQwFtk
 rnylfAhjRval/TQCXrfrdNZJRZXsRKA01iAMFxfmPWgJgc/TTbvlwm0kDPQEpb9+wW/KV2KATH3
 ByBD2wd3K9CE1+GaPDkrMdrpPYGW9PM=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6ae99b42 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qMigHBYzDqo8UOFGUZcA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030033

On Fri, Oct 30, 2026 at 10:28:21AM +0100, Bartosz Golaszewski wrote:
> On Wed, Oct 28, 2026 at 11:01:03PM +0800, Shawn Guo wrote:
> > From: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
> > 
> > PMAU0102 (Kai_MV) and PMM8650AU's Kobra_MM ADC5 Gen3 controllers only
> > expose REF_GND/1P25VREF/DIE_TEMP calibration channels; none of their
> > AMUX thermistor pins are wired up, so none of the board thermistor
> > rails feed the thermal framework.
> > 
> > Only 3 AMUX pins are actually wired to thermistors on Nord, all on
> > Kai and none on Kobra: Kai instance E's AMUX1 (SDRAM3 THERM) and Kai
> > instance I's AMUX1/AMUX2 (SDRAM1 THERM, UFS THERM). Kai's other AMUX
> > pins are either DO_NOT_USE or wired to voltage-rail monitors, not
> > thermistors, so add only these 3 channels.
> > 
> > Add #thermal-sensor-cells = <1> to the two Kai adc@ nodes that gain
> > a channel, the new AMUX1[/AMUX2]_THM channel(s) with qcom,adc-tm,
> > and a per-channel thermal-zone for each, following the existing
> > Gen3/Gen4 board pattern of a direct thermal-sensors phandle into the
> > ADC channel.
> > 
> > Signed-off-by: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> ...
> 
> > +
> >  		pmau0102_f_thermal: pmau0102-f-thermal {
> >  			polling-delay-passive = <100>;
> >  			thermal-sensors = <&pmau0102_f_mbg_temp>;
> > @@ -501,6 +545,42 @@ trip0 {
> >  			};
> >  		};
> >  
> > +		pmau0102_i_sdram1_thermal: pm-i-sdram1-thermal {
> 
> Existing thermal zone nodes use the "pmau0102" prefix.

Hi Bartosz,

Following up on this: "pmau0102-e-sdram3-thermal" exceeds the
thermal-zones.yaml node name limit (11 chars before "-thermal").
Since v2 moves these zones into the board DTs per Konrad's comment,
I will name them after the measured component, i.e. sdram3-thermal,
sdram1-thermal and ufs-thermal, like other boards do. I will drop
your Acked-by in v2 as the patch changes quite a bit.

Shawn
