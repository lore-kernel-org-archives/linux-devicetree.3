Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1643388E7A
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 02:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774320496; cv=none; b=VBZknIc9Ya0sr5J6FL8j8BSLkQr62w6LQQlaKfXKKG1fx6PF2+BG1xLUDBA0EvgBQEXqV3ghK2Xx0Fd+ijZ/gkmnC9GkPLk+lAlUkf1Vf1yIGoBRnq846/OhHMKQaL44Y3BNb86rtPkr7utnN6z4/QltMt/IoTf4ggiQsVcYGG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774320496; c=relaxed/simple;
	bh=Tmd+gxRh0zMc7goWZkYjDkOhd7+39w5YPSm0QADkkW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+Xf+3JtHDwSv1kloanB48KwO2OKYoiV/K3NBINaGi4jvsBE3hT/SuV9bbUDldeh1Y2bTookIngJtWZpecrBLDPN/yo+9i9EW/lJ9ZJc7ZUeqdkeTpzunjwCChomHxTADXWwTN/7vm2BHqdlLKym8QjzEYqBvnMQpM0eaTFsyxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inMpW2fW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I3IX4E/u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inMpW2fW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I3IX4E/u"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqWnB2831804
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 02:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U3vJrTCvtA5VbYGj6R/QkEk6
	GFV0eo4cVRNuQ+yDIqQ=; b=inMpW2fWU/qSTmX2KSH6MMXIdDKqKmJ8nvKaG13x
	ntEXhARKCDcftvRPRDUUIaZPWUUlkgzn5w0PQpUGEoevgE341E1Wod6xvWzjkmvR
	iI1PUikH5RdP+gqyOZzjzmnFjlfhazQqAl+Z9f5E4/6gmTWBUOaeE30sdFGiui/G
	K3sdDjnq+jvg8kkgnSGNm7phiCXOaZ9ZtDPet1DTErOyQ1FIxAYGnOXgMnD4NPUU
	kYaag5Yk98NkOsuqwJBHkecciGzS2/ScU9wHeB62v949X3Fm80HTINHVVOeTGltM
	GDaE92RqmNG2QscAnzUVdwQ8aiMqYfuZNt2tqB1KFHrObw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d364jtk1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 02:48:12 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so3303853eec.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 19:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774320492; x=1774925292; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U3vJrTCvtA5VbYGj6R/QkEk6GFV0eo4cVRNuQ+yDIqQ=;
        b=I3IX4E/uffIBr+0oo0271hTLYP1a9CZuNRvnG0auRsuNV+s2xQ2R0lZGGActEbfsfl
         8KoFyAirgVUlmSETDCqY7PqgRL3thAN+cLoobQzeRXh79AwVHo6tolO6HNu5KstC5dZg
         /I5bPJ7eIkt34vrwhGWj0TTHzqYrmInZAcKbl54J9XIgW0qka4mvz+eDLcgiIcZ17p7A
         66Z4NRIshSXrV6UkH5QTM2MfzVbFfhwbsH2jtBXnb0MxFkXBZLHoBylMDRNio3rjwHAh
         0JE7EntGfEUhgzth1Bnvxz3hU8r0dpio7s4UMf4EK/qepMb0xrpkzJZuK20cYhl1c0d5
         m65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774320492; x=1774925292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3vJrTCvtA5VbYGj6R/QkEk6GFV0eo4cVRNuQ+yDIqQ=;
        b=i9qovKNosHwey3/ufLh3FlnJhEBLz6JktpkImz/WOAuuXZgwxdeIlDdKRCh6bkkn5n
         b5NBc2Hju86n6jnDX+E7KbYtm3m7ENTOhFd6J8+ZSylH4h+WYALx5ekbyfgsX9OjSKP7
         rJQkks6HfgfXiEGSdcNUt2ebCd4Me4ayfrPoYGOGMuy7Wzb0hpn/ARXndhS1OWicFamB
         H1ezR0ts9idgyl9MsUwAepErRJIY+j8upDmem/edQMVaozXF4Z43NNIaLcICQSIqCLM2
         CyeG7uSWCGd+IbsHm+1W04d0x+xe/fUPC99MngGnkNVhx+XMtpO6Eo4OhVOrqB/cbQQo
         Cpew==
X-Forwarded-Encrypted: i=1; AJvYcCX+1AHkFilM8ua9/DUSr0F9z6WHZeRO8FYtTZc317P0ZUHRXboNsJuAQ7I6Rth5BOg2SGeoGUqh+KIU@vger.kernel.org
X-Gm-Message-State: AOJu0YznHM0qjMxWSnMjeS0IitTLAieA3ycFa1RtKf6VDcqiW3+00jwA
	Qke/gQjr8qD0V4POhqLFetE3ifFjSjbpGOIHTuiyDz4oj5ONYzuchjVBOYm0xQsc1ItHXeDOj2g
	i/xIwa7gQBiMC1halK5k3g5ghHlvNissuKE3Ap30wnjTnD7JDznFbspx8hYZAn2Ud
X-Gm-Gg: ATEYQzwB8bgzJk9hgLCIWerqYlboBMW0eozxqiCswAV5QTd4lEIbJ+EscqwJSNxqMgG
	7xgns5LSY1Wgs+QHOI3qP2D/qu6qc4hh8yAbTuRrnh4HJqEvV1RKvqWGTyoCpIeEFFnRT1uUmq2
	wQ+4GQDEgFjL9rh+OND79n/vo7UUDywwH3i1+BgWtoYwkpgBpl6BDAO2Y4goNdnuy75pE7qsaRb
	DBmbcDN1+vzsqQloGzyAw2VXjnI+sCLIhsbjQ0pCiCD+yPfg1r7DuV8b7qCzPKsBmcEY0TJ3WD1
	FysIcCd8hrrIYjDlzE4XLE6mW/vujGKjWp11OFMzxN9WAAkAAoCOyqYqlRbho45rb5RAaq0F4jl
	D5A2O3+v5tShPbkDkbd+nF/bYldgwyqS5nBpS3OyZ7FX7vbfOgp+Rg6GxoSxg5kr1k/nMmSPKdV
	s=
X-Received: by 2002:a05:7300:fb89:b0:2be:10a6:647e with SMTP id 5a478bee46e88-2c1096d56e4mr6573509eec.19.1774320492021;
        Mon, 23 Mar 2026 19:48:12 -0700 (PDT)
X-Received: by 2002:a05:7300:fb89:b0:2be:10a6:647e with SMTP id 5a478bee46e88-2c1096d56e4mr6573494eec.19.1774320491396;
        Mon, 23 Mar 2026 19:48:11 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b3253d0sm14093923eec.29.2026.03.23.19.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 19:48:10 -0700 (PDT)
Date: Mon, 23 Mar 2026 19:48:08 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: clock: qcom,milos-camcc: Document
 interconnect path
Message-ID: <acH7aEBvSbiNwhBz@hu-mdtipton-lv.qualcomm.com>
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
 <20260116-milos-camcc-icc-v1-2-400b7fcd156a@fairphone.com>
 <20260117-efficient-fractal-sloth-aaf7c2@quoll>
 <59d9f7ff-4111-4304-a76c-40f4000545f5@oss.qualcomm.com>
 <9f8619d4-43ac-4bc0-9598-c498d59a27b8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f8619d4-43ac-4bc0-9598-c498d59a27b8@oss.qualcomm.com>
X-Proofpoint-GUID: -6OpY9ZGTyJMYU1b-oGRxwk9SVYrpPea
X-Proofpoint-ORIG-GUID: -6OpY9ZGTyJMYU1b-oGRxwk9SVYrpPea
X-Authority-Analysis: v=2.4 cv=JcaxbEKV c=1 sm=1 tr=0 ts=69c1fb6c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=fekkFCTB2vo3PLuB2O8A:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAyMCBTYWx0ZWRfX/m8o3UhDr1pp
 Htyd5JfwkGBmw4IISFH7h5QH7U0G9UvyBUc1PUYBBm2a64Rnv8k2R0ElmuIvvu3i77VJN3cQm75
 nEOs9N6Kab21XiZnWg7Ug3i2ACqeswuOXrr6wX5XswUTJDbsQAltK7hcFG2s/fy+a36voY65DaD
 IcQpWTCFi81bWqzt4XExxXQTXiOgjIQ8A+wUVlpUa/Zkb8KGgmsocZTE7vUVJcfbryR+sC/NsNP
 v1PPgExkocwhrCMElbIX9NP1P+SFgJvHsLCy6FLI75rwqdcKzlamQJ2OB3u7+KtO7/FkiIss1Id
 /WoGlDAZQIUdwAOl4423jdMS9Bb715UUMrItUCorOJKV+Su8/7dF0Vnx7JaP1OV/gDdRFA2mGxQ
 /syGMM1DllX5xHXnFdIfzhFEZcYGKXJAoxVaHd3NnvlvzZzB3aMIFSiA9Bij9788nLXIOV/rwNO
 ER9X0V+5DGJz16Oc2Bg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_01,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240020

On Mon, Jan 19, 2026 at 11:28:07AM +0100, Konrad Dybcio wrote:
> 
> 
> On 1/19/26 11:20 AM, Konrad Dybcio wrote:
> > On 1/17/26 12:46 PM, Krzysztof Kozlowski wrote:
> >> On Fri, Jan 16, 2026 at 02:17:21PM +0100, Luca Weiss wrote:
> >>> Document an interconnect path for camcc that's required to enable
> >>> the CAMSS_TOP_GDSC power domain.
> >>
> >> I find it confusing. Enabling GDSC power domains is done via power
> >> domains, not via interconnects. Do not represent power domains as
> >> interconnects, it's something completely different.
> > 
> > The name of the power domains is CAMSS_TOP_GDSC (seems you misread)
> > 
> > For the power domain to successfully turn on, the MNoC needs to be
> > turned on (empirical evidence). The way to do it is to request a
> > nonzero vote on this interconnect path
> > 
> > (presumably because the GDSC or its invisible providers require
> > something connected over that bus to carry out their enable sequences).

The GDSC itself shouldn't depend on MMNOC in order to turn on properly.
It should turn on just fine without it. There *is* a dependency between
CAM_TOP_GDSC and MMNOC, but it's in the opposite direction.

For MMNOC to turn off properly when all BW votes are removed, the
CAM_TOP_GDSC must already be off. If CAM_TOP_GDSC is still on when MMNOC
starts turning off, then MMNOC will get stuck in its collapse sequence.
MMNOC waits for all HW clients to de-assert their active signals before
it'll allow itself to collapse. Most HW blocks assert this active signal
more dynamically than camera does rather than tying it to GDSC state.
The GDSC asserting active signals to RPMh that prevent NOC collapse is
unique to this particular camera GDSC.

If MMNOC BW is removed when CAM_TOP_GDSC is still enabled, then it
should reproduce as an icc_set_bw() failure on MMNOC rather than a GDSC
enable failure. The icc_set_bw(0) request would succeed because RPMh
immediately ACKs down requests, but the collapse sequence would get
stuck in the background. Later, when someone calls icc_set_bw() again
with a non-zero BW to enable MMNOC, then that request would fail because
MMNOC is still stuck in the prior collapse sequence.

Note I haven't explicitly confirmed the Milos behavior, but this has
been the HW dependency for at least several generations of chips now.
I've never seen this GDSC get stuck turning on because MMNOC if off, nor
would I be able to explain offhand why that would happen. But MMNOC
certainly does depend on this GDSC for the reasons stated above.

So, regardless of the originally stated rationale, CAM_TOP_GDSC voting
on MMNOC *is* a logical requirement to guarantee that MMNOC doesn't turn
off when the GDSC is still on. Otherwise, that requirement would be left
entirely up to consumers to understand and enforce.
