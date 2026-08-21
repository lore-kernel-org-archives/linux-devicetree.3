Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9616E477E21
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 10:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787308620; cv=none; b=WB+9KnxebgkbTyint2I8puS3FkhXJdVkqBxLJSf/wH1oIMRwLrkfr9XC02mQ5sS6cVOeXe9sa9eGrbn1c7ND7FoDHTwnQIJdXBA9YOR1XQUtzw5iuWVwkX8lLhDk8vLca6HfhF5wSbGTlN/DOCgLEDs+ShIhsFSX2A/9/ZBTFbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787308620; c=relaxed/simple;
	bh=b8OrTdm7l/bHAh1BFCbvKBBAJlt33YXBsSrQAG+/eqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TuaHhoGrKGiz+e61PhBlUz93fYvXLqNBzkgNG5C8+IMnBfBLPZn8h9xkrK20T/bpMfgOXdRN6tAot8KU6cZ4ViOLIZMrk24TorDqBFVWW2EAjPLsmFDLmyXVMYg7sIMQtWUyhGiOeMn+m/tzvY4R1XzURSELtPSOnXQ2TXZtw+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pzhr/cUG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1GLX+aC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pzhr/cUG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1GLX+aC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9LnMj1983250
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 10:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x+/TUZQqtWMcSQBmELloooyymV8cy7fWHjTFq4Y7vHE=; b=Pzhr/cUGL+CVVoi5
	TXT7wCB/F87yxsygEFZGnZ+L8TceExE8cotOWyNTADW9Hfx2MZwqBjnu39ZpX3bt
	A0L+aBkuaxLYyBpssKHDwyG6d2I1qK4ttWGlm71bcB6vdQWBJJsAj+GNgATVsPHw
	l27BGzDJAtq+/rR/oNyO/nTvFvjjARru6PKbKZgw6WqofUKQcr2x/Ud8ZRzIaaaX
	qhHcS+UziN8jfZMncmKEViL/li2ZUvD1U/lliPEAhUoUGIAF+9r0OCY4Nub28eaG
	fqDZzekn6WLUt8amT9bMV72I/xUF4yL8v+XL7HdkHWISQuCN0sgb7Hwjn/r1rOrb
	+wmJqw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6cdshvq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 10:36:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so1546403a91.2
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 03:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787308608; x=1787913408; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x+/TUZQqtWMcSQBmELloooyymV8cy7fWHjTFq4Y7vHE=;
        b=d1GLX+aCfREXn8M69pjFZ8Xj3IXmWoeN+mb0Tel1n/9KKPdHvKHvOdfutmQl78ociF
         T9B470VEoJLzPrwdiIgVNf9P6JpFCXDe5qWIl2bL1LpKLufRIc0aBUbusvE6v+dFxMrO
         H5qLjlcthcGGE8nTYW1fazqgGo2bmh2lz4e2Sh1+38w6MR4xv4u/XSUoUDPzE3IWjDfv
         opPVo1b4Mxx6qApDqFFEoTPAL02cNSj2ITfoUKg0c2T2vwkhGN2NXj2jlPiROBInsv7X
         2EHAq/tuB1ZwdjgAy7Wzk4w0UR9SSJppoWLPZACs9M8ByDU6GXIpAC/W1EuWIbOKYrz1
         gnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787308608; x=1787913408;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x+/TUZQqtWMcSQBmELloooyymV8cy7fWHjTFq4Y7vHE=;
        b=Myh7PTg+cxNWEGsqGk6ayha/MznfgdJRY6CkqsBBI6/9N5FeuuMrnW/mPo8XQzieGj
         +BZTLXILONAtloILh4pfPi0b5g5Cn4qBXQYnTlnXqPpRMAQQOgYzRxINEYvrRKVnDvUA
         JlQToveo3za4GH4Flb2AMFiAZhonbiz5uusbRbr0fTr868uoNhRJBMy6SAtq/k8h8aBd
         ngUnipZoVaNyo1YGlEd7LRDhiNAT0UQYHQocVIIU7S4wKvO+/PoFrwtdhseoN9psv78N
         ElLw0P8k6C16DEwVHE2Zp6R7bV3EDUbZ5l2Cgj8f60rZGk8bV5D1J2JEsVXTvHcESAbm
         awfA==
X-Forwarded-Encrypted: i=1; AHgh+Rq1i0kEt9jso1LJcdvvpehAoI6+4+3EB5CqF9R6cElfIfCqwnvFB0Kp9TBASnaj2KGbEJYM4jkM37VC@vger.kernel.org
X-Gm-Message-State: AFuF++lnua9BqWJ1zpkG4Sr4SMjKC3Ne0B/zDepXHEpPcq1CVau90kgO
	28z4c2hoJqyfmTG3OjK7qiVetig9xdoWXtJPomRQPy/Jmt6aUmqs8p7vzSiA/vGJw8J1RvZGj+B
	GGqz8ITxHRXBZMTkeKh1/P1XmkXEoke8Yg0E3FsnicFW5Ve+yAutnztmihOr7vaf4
X-Gm-Gg: AR+sD13eTIdkd3FWr5ziFGhpiJ61TFlBZ6qQoq/bfOqD7jo4JIGoOHwwarVRlJBX3CE
	LcGOviqphllJjnxdy0TeXHZASt1r0KR1Mf5PnWZSvJtCXyouACmZlRUgWp/lfUpZWK4vGcLUWCw
	RyGYUTQxpe+QpS0Wg1Uo1Lpgb+MjSfLlbWHcjs3rJ4+SPt1esJTtVvrUnyi03OL73Q/Y1SinU62
	0yH1+sYWvcO9LcZOLWOtQzC9q42lFaHsFPDng3OkH99Qk9MdN+LHeHom9nrCWRNUpBe/R5SXPaB
	HlAx43x0hJWNTdVWeMGA7JgXBMshp9Ttb7uQ32gxq631uf1J9aZaB+wTzcPRfmsoZYllIcqNmW2
	jIaeppb2EmvUou/r/SCIzyboibUx9STF6JCM1RQ==
X-Received: by 2002:a17:90b:394b:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-395c384d95bmr10132140a91.14.1787308608490;
        Fri, 21 Aug 2026 03:36:48 -0700 (PDT)
X-Received: by 2002:a17:90b:394b:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-395c384d95bmr10132085a91.14.1787308608069;
        Fri, 21 Aug 2026 03:36:48 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c467d907sm2662874a91.7.2026.08.21.03.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 03:36:47 -0700 (PDT)
Date: Fri, 21 Aug 2026 16:06:39 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v11 5/6] arm64: dts: qcom: monaco: Add OPP-table for ICE
 UFS and ICE eMMC nodes
Message-ID: <aogqN5IUBvHgmpoG@hu-arakshit-hyd.qualcomm.com>
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
 <20260609-enable-ice-clock-scaling-v11-5-1cebc8b3275b@oss.qualcomm.com>
 <d8fd7888-cf7d-47e2-8e77-3ba705c88502@oss.qualcomm.com>
 <ajjmXMKdWzae5qqk@hu-arakshit-hyd.qualcomm.com>
 <dcd6f0e3-46a6-4f57-b4a6-0b9362b1a8c4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dcd6f0e3-46a6-4f57-b4a6-0b9362b1a8c4@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: QGOmr7tjJkz9ytXJ0ctg1dp2Ncns4xW-
X-Proofpoint-GUID: QGOmr7tjJkz9ytXJ0ctg1dp2Ncns4xW-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA3OSBTYWx0ZWRfXxmJ6FWghNsYy
 SlvoAUSKOLKUP+vroSadnireOwN1ov2wDj01zGsA9MYjWSJCOKulUvI9SeCkODnyKVs2kq1hf/f
 YjZhlxd/wg0diAYLzGy1zDo8OJ4a6TA=
X-Authority-Analysis: v=2.4 cv=RN2D2Yi+ c=1 sm=1 tr=0 ts=6a882a41 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=jk3V8XEzhubCWnqVx50A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA3OSBTYWx0ZWRfXwj10RVbefNM4
 WC4uCv9vQI9TICidpEVGIbRQ1qjZIexkdXEXxXgos3ryo/rYwdjxo54rYJBhthDCFxN2jgfqlIE
 f1NLwvD1rJgUhrqXi+SmX67kRTJrxj/eOJaAxHOPcWwPEpMtXVWfuACVy2wK1rebUrLyuhXgNQA
 ZhUSPAr5g3JVvBfqveRcO9y1O4ZakOrTIAQ1JQchpB/6l2nfxZOhQMBV/ftf81s+BOyn4IZDjgj
 r52FFJJfPVHgUZTzXCeaRp6qwCEEJFNQOm9ucYUM0XhKd0Q6NEmo37QuLVgwn7aie+5cQkmFXNG
 OPWiON2g7h2YNmR/EW8Yj/ESg6e+uHnyTS4S0BJCyOr19pTELkZALByZxemdcmcHbixqsyp4tBj
 Jv8R7LSn58hfbQG1vqEtChlZi0t9nzq5qIm0/2CHtMXeiv9DiveoByDvxp8D6KHs6BiABlQdsh+
 RYbaXB+5fo2qVItXe4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210079

On Fri, Jun 26, 2026 at 04:28:54PM +0200, Konrad Dybcio wrote:
> On 6/22/26 9:38 AM, Abhinaba Rakshit wrote:
> > On Thu, Jun 18, 2026 at 03:04:57PM +0200, Konrad Dybcio wrote:
> >> On 6/8/26 11:47 PM, Abhinaba Rakshit wrote:
> >>> Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
> >>> an optional OPP-table.
> >>>
> >>> Add OPP-table for ICE UFS and ICE eMMC device nodes for Monaco
> >>> platform.
> >>>
> >>> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/monaco.dtsi | 37 ++++++++++++++++++++++++++++++++++++
> >>>  1 file changed, 37 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> >>> index a1b6e6211b84d0d5008231c55613a0ccd61b9450..d9298d8b7874b8669b2cded2a28a99dce6eadbda 100644
> >>> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> >>> @@ -2742,6 +2742,27 @@ ice: crypto@1d88000 {
> >>>  			clock-names = "core",
> >>>  				      "iface";
> >>>  			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> >>> +
> >>> +			operating-points-v2 = <&ice_opp_table>;
> >>> +
> >>> +			ice_opp_table: opp-table {
> >>> +				compatible = "operating-points-v2";
> >>> +
> >>> +				opp-75000000 {
> >>> +					opp-hz = /bits/ 64 <75000000>;
> >>> +					required-opps = <&rpmhpd_opp_svs_l1>;
> >>> +				};
> >>> +
> >>> +				opp-201600000 {
> >>> +					opp-hz = /bits/ 64 <201600000>;
> >>> +					required-opps = <&rpmhpd_opp_svs_l1>;
> >>> +				};
> >>
> >> Since 75 MHz and 201.6 Mhz require the same power level, is the former
> >> OPP any useful?
> > 
> > Yes, both use the same power requirements. However recommended by the ICE team,
> > the DT should include all opp/freq supported by the hardware.
> 
> Is there any reason at all where the OS would prefer the lower OPP?
> 
> I think you at one point mentioned some dependency vs the storage
> controller's clock frequency
> 

Monaco UFS controller supports a 75 MHz clock rate at the same power level, as
specified in the hardware description.

Although both frequencies (75 and 201.6MHz) use the same power domain (OPP),
retaining the 75 MHz ICE OPP allows the ICE clock to align with the UFS
controller’s clock frequency. This synchronization is required for the
controller’s supported operating modes and can help avoid unnecessary
frequency mismatches.

Abhinaba Rakshit
