Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4706380FC0
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 03:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779075346; cv=none; b=T65RyVD62gkYsU8HXTArYpGVTcRnRT51avEWudo/U7iuJVrrhCrnb/9USePzQBz9/K/fZODEPKq1InQqHxkM+tj2ZTILBKGNi7dhyOV0d6Vk8o5O4JXkuR2KztoHzMrTSuzhBWFtqF0gFBetUvsWdbu+6kZWCRB9BZklHTIFErg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779075346; c=relaxed/simple;
	bh=kUsbM86mQMkJ2mAiobQt57+EdQcwjJauLynG+k5pNsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hrVPVoyFtk5tsNr6CxexSwMeY/tqItWA53suYL7zicByOmMjr0z1v+MNgu2daoEw3jxyuQ8ak7sd6fLhPn/QhTXsAr+QYapgVTv3JJo28fT8DneOQ4zSbQ465/HnaLkg1nuU8+hsh8r0eP8F9gZtCkSMWmpSYrO6mmUIDhMYAw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=co0QUJ3g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LyQ0KKJv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="co0QUJ3g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LyQ0KKJv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HFVcqc158661
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 03:35:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NclULWFnp5Wyf9ypfaWjAmif
	a63DzbbBWf3uDDMhJ6A=; b=co0QUJ3gPSc7AVoIy3sUbXiWxibGWwNB6cmFa4Wx
	Rq8hpk2r8qppeC061O5be9Q80yKQKs5RMOd7u8je0lpg1NtA210iqHYTGXeLEiti
	DE0zpECOP08qkHaMcbEgC5CqTkV7D4uKrwDNcUtYlVPnXQv6YwJOtG5NptelCo5z
	NACTSS6pXvKZNBhEHbjPaaZB32TaDtxLxDPeKkLYGcPF25X1WoasiIS/Xj2wHjPo
	zpRI48HoqVOx1HugwKS9kMLlZC54MIRDmt1UtgMYHTcMkgsURWeJRxTBCr6jbygG
	JbZqg0+uQwktsOsQWWqdA+w+DapOPrJIc7vcWqE+8PoVUw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gy54dcu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 03:35:43 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2f3ec2e8d07so6414368eec.1
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 20:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779075343; x=1779680143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NclULWFnp5Wyf9ypfaWjAmifa63DzbbBWf3uDDMhJ6A=;
        b=LyQ0KKJvmkaz4l975ZUnxrKkPbmg26cEZIZ7x2FtqD51nZIPWloDyAotIRN7ut9KJu
         hQzOtyshfZRTB5RH+R/Fq4hfpBia2W5amybc2g4/he1RyY0nymi0ky6sBF0ZxLZkvLNB
         ixgf5zUFhJD7s5/GhepgBIbs/dzJnetaMhi+4zdCEEIwaOaVc9ACAPK8BEBsw0hH4aMZ
         iv+d2kb75qv5sCLwAiotgBeBW2/u4o8wcnvZ4wPaeUgUidyn6ZGYzak8cBTsEE8Vn8J5
         95DAPBQP5REYdDi8mghH+uplJAU+Kxd4LlKWmemaxGqRI8bpQRBnU6ITb2OUFMNlAV+I
         FNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779075343; x=1779680143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NclULWFnp5Wyf9ypfaWjAmifa63DzbbBWf3uDDMhJ6A=;
        b=pDee75gsgb9ZzP0fD/QeF7laCfqX/tOeee4as4grPNhw3u0aU3c3A+XKauP28QCp5H
         IqhV/6heSjtOtnR1Xk377xtYRGK5kl48tvYzF/yTex12tTjj70s+IpQtC9HN3+QekpF2
         K/acz9qgcr8CJP4twBIK/2JwfCGAWj9oeLjW6shu+lmkWbcfhWPu+tkcLop9447P1H1m
         OwGC6KGX8QG6y7KrMj12IayMk+3T8T2uUGEuk9ZOp0J7oxM/NrAuwka00rWeQzD065g3
         ZJuE3IUWxq3ObrO3rwouomqugaterTEU1P5qg4cQKT2icPv3Sa68yB9lSsWbyN+jw9ab
         Qx4w==
X-Forwarded-Encrypted: i=1; AFNElJ9zdvvPH8qrekSTpaT17BkRaQ8OBKYRsL8+02QrQTH33wJjHEnUv4lpClYBL2fEBCeyj8PKeJczz18t@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+ZXcSa+Ahy//eBpuj60VfIkIlGOAE9QkWo7QL/IAAtQPgqeZV
	t1J+3BzOIC6iNGGwUfjpndEYRw7OkbeTae2u1UH+S6yLxgNeudlUMoOlCJnkzN5bPXormf9+KNq
	8mrwIS0x/nUGH1EsIHeiq8LHD6NyRUnXFXywYNrhRWzZrdYKHc3+pBPhXFfgd2neW
X-Gm-Gg: Acq92OF72OlGEUa+YjKcmosHzNOOenpIFHtdEIRqGQ1crCXqItCZC5rBA/x0ijED1be
	7Ij59F/yf/dr4n+AmlfESiiboiYWr19Rs+GMrQAUMTPTdTShw/FMldoQN70MJnAQ4/8GI4M1rxB
	/sxxwqXJKBeqzOZIgOf8r52GO1EMGVaSNl/0eV1VEKbwRAuU706t5gaT4kM5wYHi/zuuTcK/EUT
	IeVuzAv76ct8leCnToiImITvuYJ/QHg+fDtPtdW2DnfWfDsEfs9etWp0MGi8ryc+quVE/233Ta7
	XqUwLCUbFrf882XSVlggi9YhZ3fIIxoMLf2V5oG5pgVo7p4ptHMjDX8yGDU1NoaPnV+p7whpaFP
	PMClS268DSJcJkCcEtpC/7CbFH3OlXP7yPbBu4BK6GZTIcedQTAL+hJhyrFKB0EPHZ5/u
X-Received: by 2002:a05:7300:8184:b0:2ca:8099:ffc0 with SMTP id 5a478bee46e88-3039813d598mr5804137eec.7.1779075342611;
        Sun, 17 May 2026 20:35:42 -0700 (PDT)
X-Received: by 2002:a05:7300:8184:b0:2ca:8099:ffc0 with SMTP id 5a478bee46e88-3039813d598mr5804123eec.7.1779075342049;
        Sun, 17 May 2026 20:35:42 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30294500726sm12214853eec.10.2026.05.17.20.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 20:35:41 -0700 (PDT)
Date: Sun, 17 May 2026 20:35:38 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: qcom: Add QREF regulator
 supplies for glymur
Message-ID: <agqJCmQRmFwhFClV@hu-qianyu-lv.qualcomm.com>
References: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
 <20260506-qref_vote_0506-v3-1-5ab71d2e6f16@oss.qualcomm.com>
 <20260514-outgoing-literate-dove-2e2a73@quoll>
 <e495cf7c-a76c-4ecc-aa95-36fb0ee54b80@kernel.org>
 <aglY9of/4714us2o@hu-qianyu-lv.qualcomm.com>
 <e72e2f53-caba-4c53-b494-3c284eec54b4@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e72e2f53-caba-4c53-b494-3c284eec54b4@kernel.org>
X-Authority-Analysis: v=2.4 cv=Wusb99fv c=1 sm=1 tr=0 ts=6a0a890f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=12i62POrZIV3eSzbxEkA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: EXRpBht9omk-x14YXDY0KYCyplSLDbzy
X-Proofpoint-ORIG-GUID: EXRpBht9omk-x14YXDY0KYCyplSLDbzy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDAzMCBTYWx0ZWRfX8aVWZaF+QeI0
 qgH6PwJbaa63LEsqIFVpm7Z83pVzXIcF6yJlR5tFPGqHjlNanB2r+ov+Xx6jJX3nZQrNe2VLQuS
 isGI5DhDAyIQLq8t8jN2hm2RwIGFB0u04dgYAcME9xn4Xo51Z+flbcGPhUxSVQLJOoZg/olCzDX
 KTsO2rpmc5D76Y+ionQponsPi9RzZ4mTL7DL+nEeAwLDK1uz7kp8DAyt8GWLEi6YgwZKGpTHIkx
 0b+WqpELnzcDUjgU6T9BO2sde9Qh9STC2+RMoHDAo05TDQp9ugAoHFnFyFOKrCvnpvwlXOrtPVu
 cyX5xk3jKGdrVWeJ+O7xEn8oOLiG0FoEPc9BH8CCJSf4vnsYk8tcPKE5m8pmuxYHinizus9evEg
 WJbuek6Yn247dfK8JZmBAujIy6vtWIY3GAXKGgCr1At6kO9b/o9JepeVPi6oYHJ2HTXx6Eb1ICA
 Sqbaa/lbOlbkydMjgiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180030

On Sun, May 17, 2026 at 10:28:48AM +0200, Krzysztof Kozlowski wrote:
> On 17/05/2026 07:58, Qiang Yu wrote:
> > On Thu, May 14, 2026 at 12:35:19PM +0200, Krzysztof Kozlowski wrote:
> >> On 14/05/2026 12:22, Krzysztof Kozlowski wrote:
> >>> On Wed, May 06, 2026 at 01:43:51AM -0700, Qiang Yu wrote:
> >>>> Add regulator supply properties for the Glymur TCSR QREF/REFGEN blocks
> >>>> required by clkref clocks.
> >>>>
> >>>> The vdda-qreftx*, vdda-qrefrpt*, and vdda-qrefrx* supplies map to common
> >>>> QREF TX/RPT/RX components, while SoC-specific topology and instance count
> >>>> differ. Document them here for qcom,glymur-tcsr.
> >>>>
> >>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>>> ---
> >>>>  .../bindings/clock/qcom,sm8550-tcsr.yaml           | 57 ++++++++++++++++++++++
> >>>>  1 file changed, 57 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >>>> index 1ccdf4b0f5dd..57921cb63230 100644
> >>>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >>>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >>>> @@ -51,6 +51,63 @@ properties:
> >>>>    '#reset-cells':
> >>>>      const: 1
> >>>>  
> >>>> +  vdda-refgen-0p9-supply: true
> >>>> +  vdda-refgen-1p2-supply: true
> >>>> +  vdda-qrefrx0-0p9-supply: true
> >>>> +  vdda-qrefrx1-0p9-supply: true
> >>>> +  vdda-qrefrx2-0p9-supply: true
> >>>> +  vdda-qrefrx4-0p9-supply: true
> >>>> +  vdda-qrefrx5-0p9-supply: true
> >>>> +  vdda-qreftx0-0p9-supply: true
> >>>> +  vdda-qreftx0-1p2-supply: true
> >>>> +  vdda-qreftx1-0p9-supply: true
> >>>> +  vdda-qrefrpt0-0p9-supply: true
> >>>> +  vdda-qrefrpt1-0p9-supply: true
> >>>> +  vdda-qrefrpt2-0p9-supply: true
> >>>> +  vdda-qrefrpt3-0p9-supply: true
> >>>> +  vdda-qrefrpt4-0p9-supply: true
> >>>
> >>> Either I do not understand your previous explanation:
> >>> CXO -> TX0 -> RPT0 -> RPT1 -> RPT2 -> RX2 -> PCIe4_PHY
> >>>
> >>> or this is still wrong. There is no TCSR here, so this proves nothing.
> >>> If TCSR is TX0, then you do not have five of them...
> >>>
> >>> My previous comment stay - you are not describing the actual hardware
> >>> here.
> >>
> >> And it should not be my task BUT YOURS to verify this in hardware
> >> programming guide or manual, but nevertheless I did verify and the
> >> manual DOES NOT mention these supplies. For Glymur, it mentions 8 reset
> >> ports and 5 clock ports.
> >>
> >> No supplies at all.
> >>
> >> Then I went to QREF and it does mention few supplies but completely
> >> different, like mx, cx, px 0.88 and px1.2, so none of this matches QREF
> >> either.
> >>
> > 
> > Honestly, I couldn't find QREF LDO-related information in HPG either.
> > However, you can find it on IPCAT. For example, in the glymur power grid,
> > these LDOs are clearly documented under the LDOs required by each PHY,
> 
> How is that relevant here? This is not PHY here. You are adding supplies
> to TCSR. Do you understand what a supply is?
>

I'm telling you the fact that I see from power grid table.

- Qiang Yu

> 
> Best regards,
> Krzysztof
