Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531794;
	b=1DuLeEyPbAVjW2Nj7vO3RYMqft+ncXmgwTgIhN9s56skv4kdaMQRghA9D7YIBSs6HKbF
	 Aq9T7HvqIv6Ekojhtd9RiG9mMGu79emQnNWf5L0f7ifk94CYUK4U3Q4qdlJ7XyYo1bRqN
	 9tq6t5BWgWDRIJAtDeNavCzgRI1BNLgalV0G9syltkVOXSB4GOB8/XIUC0fHAchIlMxpQ
	 tE4TNYKi3mIkCnQfce8zD6QgYeHAOzAotLc/+w9SBv/r3xSBPKBtC4MBQY850r0ULQc+n
	 I2SW4nFpZ+/qTtliekJEXZDJjMx2oc4gD2jkKiJL9A5b9CklDOsv629n3UwZQNI1rig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531794;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PGrzHmWAgrXCB3C620jp6z1AC30bEbgyxfWHGuCVEtU=;
	b=gVdxZy/fk/YMeDt1QcLJuN+5glt4FUScIT4RWQCi+pPdXaogynmyDNMnxhGZVF8OOwHi
	 w/CYyxU/HwddHJ10sCvP3e2kPKLGETyzYbQd2ityyVx4ITucrFLf4nIFdWKB4TO0hJZS7
	 zz51aQcWIVEtvb7CgH1+jy4TYP5UQwtzdrhjzGd7US4lhkzpw0xj19RY1FttfwfMMgTtV
	 AySyL9tTrTvqkIvld7qlS8HGFiPl/GwhlVUfxdzEF7Ul237DVKfmUXcv0ZWrqmifuOLa+
	 hEoSn2LyBgZVSCh+QrNaPooSD2oUaSVvdHnJAkDQV9fR99+iWq0cdLm73Ydhv4uPmpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aYlU1j1z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XILWpK0p;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E6A606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1E6A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aYlU1j1z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XILWpK0p
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOEbrU61087886
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PGrzHmWAgrXCB3C620jp6z1A
	C30bEbgyxfWHGuCVEtU=; b=aYlU1j1zcGa2EtTfI7LsJbCJrrS3ZN4Ee+kMv8zR
	h/Ig1saVVm33mw8dLJ+cLCHBUQxC93D80Zy17XXvv9O0fsF6XcRr8gc+my5FFGux
	6sP2oRKkJ6Ny9HN/t5d/v4BfBjHqZ3FN5/YmjT/vmhWRXR/0S8feEKI/zuXoQvf6
	Mc8BBK/QdEZ0E9dQSng8jAj41s3f3bKA+wn+GISylalh7oYbnUHIVQUkOnznZrm0
	F0iK7A4F8+mETVQ2C3GKGmF2ww0wUyRa+71gaS2apvHBSCz6AUTVxwKltiMDy8Is
	vzVgDnGpHr4HYbSfQhulH/7T9RZlS1zYlDjzJG9i2TLpFQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky37r7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:49:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94961ed97d6so814933285a.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 06:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795531792; x=1796136592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PGrzHmWAgrXCB3C620jp6z1AC30bEbgyxfWHGuCVEtU=;
        b=XILWpK0pU2tbsp6oHgGUMXLhtjb5vGSgtN2w7GuEXSRJrkfi73xN+NjMwhuggnA+tL
         sOcLIQegMjaivw9vWCsHsGZ7zmufoBi9rQgiFQobPSaEUHi8AM0/pkGdYO+HfLT0Ck5K
         m9ezrxinRf5yE8Tz0KGjOfcAQRPz7ON/ytA6adND735QPvmf8DZUJfZ2C3n9WjlvS5jP
         0DCD6Duwp9znS1tFGm9neHBqqAnvTePuPP5G1DETmJAIlBJTdnpFwiKhmV7hlp8zyOV6
         iPmRnmwqcT983TL/SK/tiDH0rR3Rarq8+qCQsyOy+S+IEeJLYXxxqDKEWPFjtOBCXSc8
         8JKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795531792; x=1796136592;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGrzHmWAgrXCB3C620jp6z1AC30bEbgyxfWHGuCVEtU=;
        b=1I1CPtSNlsJBzE/ZwhPN5PrNKuOMloMF50VWatIGZLHtH5e/ewa1cM2u3UoXo9cdju
         9deZ2IYpGg37L2EPzU1CFnaSJvYpZqM82v1sjvI634oZepQroQCChGUwbrM7/MfJIKQr
         v0VHyfX5FgRKP4fwvQ2i0bwN9hgiHzWW1E0VuWuJy185PT3FEZuckEWBPgmW1tCWQ8vK
         OQogHNPnRRRtaUeMJ3lgBT6x7xJNRKotrpMtOC5HH9nYXOPhn7CMg+VDM5aGzQF7Y+uB
         VnyOHZ0vRFqxCLrIqyOz5c/XLaZ92XX2umEFwV9oYarj5+NM2dezibR0qnZq2/69wD7F
         O9SQ==
X-Forwarded-Encrypted: i=1; AL+hErHjNU5PSRdYH6wXosj+bB48JWjEHMMULt59KgLJMewFYyc+lusPkhCACs1InwqBm0Rziep0HMdMDeVS@vger.kernel.org
X-Gm-Message-State: APuU4Z9f1fdsJS/5BjALovwgjxDn3VAyGqTRqw0iEJxEavOVjBknEBoy
	8PYpliUsC0zu+6ac//7XfQ0+wU7kYyOqjZdSg5FmO+zAEYKEY33D8gIzJKQIBhGE9b7nwVwijYS
	fqhdxj4l53BkCAOjxXy9RqgRUrwIShRdAvmvR4x4r5eMaIXCHd9O6Hj66THDrGqoL
X-Gm-Gg: AZFdTZcrPp9hwJQoBxeiU+TKEFOOfKVftIAf908gPUW+sjxXc72BcYvNraJhZH6BH4B
	2OFzAFolQOYKQHzKIgumB/5445NX0NDpoDBLCsJJiUVTv+eVAGewVxo69HFzjpnWZ34LR8QT9ox
	Od0c/jq2AuHyXEatf6zKr0AlCm4EI88zhPc6K5MaMvMPwPNKqaLAtr5yAV639nga8p5s+il2LXN
	3LNF1FUXiXakrokN75/Gcgt3KonLwrXDfDIYMiaIZyFaU1G7+WhBSlXUNSxDnmYZVV0Pp7Y27Wt
	gaGhZ4ZrK7qGel1Uav85Xs53xDVENkKV2xDYpOyARIgI+pIfkUI7lYsIcb68zETI85JQ0bn27W5
	wbSmlSmN8Em3g9oj5uz2KBK02T/FAofOq+1Iy3aQgKcQc7inPjHHY2ohaBAKTj4gb
X-Received: by 2002:a05:620a:130d:b0:93f:231:9ff with SMTP id af79cd13be357-949b35ff0c0mr2637254385a.27.1795531792095;
        Tue, 24 Nov 2026 06:49:52 -0800 (PST)
X-Received: by 2002:a05:620a:130d:b0:93f:231:9ff with SMTP id af79cd13be357-949b35ff0c0mr2637248885a.27.1795531791484;
        Tue, 24 Nov 2026 06:49:51 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm228040425e9.0.2026.11.24.06.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:49:50 -0800 (PST)
Date: Tue, 24 Nov 2026 16:49:48 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: qcom: gcc-sc8280xp: Keep USB4 uC memory powered
Message-ID: <l4wgcaciznjow767rluh43dvinr66xgouc6kzbs6rvqu2nzeqr@qoebva5eeudy>
References: <20261124-topic-8280_usb4_clks-v1-0-be083a711eb4@oss.qualcomm.com>
 <20261124-topic-8280_usb4_clks-v1-3-be083a711eb4@oss.qualcomm.com>
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
In-Reply-To: <20261124-topic-8280_usb4_clks-v1-3-be083a711eb4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b05a411 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Qx1CT2emN0pV8My1H3wA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: YEDvSKuY0lGM7Jaf8xknHgjfdZelfwFd
X-Proofpoint-ORIG-GUID: YEDvSKuY0lGM7Jaf8xknHgjfdZelfwFd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NyBTYWx0ZWRfX1OmWVabeCGXl
 0J3fRJ6tMHbt8kfIbMUMKpNQGTRaBBlzGttlMaO3gueURmofkzVKnAOmC5jiH7afGJ9hpnidOcI
 KJZ2mFr2UUZ4aWB4VmhyAj9lohEpjnQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NyBTYWx0ZWRfX1a3mDQ37oib1
 Ecv1ADAakNYSZd6CK9dADtAH9yEBuxFDfe/Izy6jotR9l2+tXwuXOX8GblNGsKewlwJ9o/WjpfX
 kqfXAiFo6BYyf5nWj4Tfgv0PBefVYMnx+GJWR9QRR/dSizGp0ZlIGH+9jW5E4Y1R33thmDmwLNM
 Se3n6dKxIyA1eMEdl4fdod7wwP5Qbt8Z7VlgAz0yqoEG0wjs14SdNSVLoQ/ju2tH2yw3ATUY/sO
 /SRPZZX88gbDmsATWJKfcjtfMe00A4ET0xqqmeRKisIUKvQWI5Vat5rgrA6GqCKC8MP2+Nf8tiJ
 AUcvKP9OzXSmnHNsYCdHO1o01Yp7dv9POIhJcxUnWuIxQvx7zpM8WnqeWmc519mfgvSiuHjXdQd
 +8SNUZtew2hYD7qrQeKOclByq4JkRpRYwqCKrCBSmi8d7oedxJMPecEHBuwQA9y4i4N+uqXr/Pi
 Dreg59/RXdFtVEeWQzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240057

On 26-11-24 14:30:18, Konrad Dybcio wrote:
> On SC8280XP, the USB4 uC's RAM contents may not be retained correctly
> by default. Set the corresponding signals to force it.
> 
> Fixes: d65d005f9a6c ("clk: qcom: add sc8280xp GCC driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
