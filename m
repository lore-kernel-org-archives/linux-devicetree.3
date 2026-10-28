Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793166741;
	b=iTs8l8coq/fZBR0TvmNApv97I892FuhQcoE2EN3JsP6/2mYMo1KVy+V3omPUJb6eFs0U
	 YAcsLsAbI1ONzd+n/KegUwFQEuZjFvDQuN5xUtpcMvT1JFzI0spE47+coa1eNzsdZoyeo
	 mvXs0FaQE+Ciwy0O8IoQOJj+Npt3ORBry/v48vQvQes1fehPwDreeDKmOxem2QMFYYdxS
	 KeTFeXAHipZns4DL8qc6Nqsn4dmxFuVDeW26cYturNdqBQgz7dn6b75vP1ff4VD4YKmop
	 fHeuAkYQC3IhcCB/dUpiNWSgYUCDmbvypNol3ORNFiTGDvpb+mKCTMYCFXhdRf3BKNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793166741;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IYwAwKNsQ3Zd8ZLk9m7XPS8ilKZ84ltU/SVOXi75RGc=;
	b=MD+ZGGPbyPffvOSyDhTbt1DxBjzXqiEnBgdAAXt+/7AFGcMr8Qe0FWvUsSKKbojVLARF
	 EUTSGPBkttb+NsJvr6J2bNiexcyC2vH3BXlo8O9euO3EduSTg4WsQNtusacMUya5vcbrd
	 Zvt+2ojfUCwMeb0zWd9e0IoNcrqJbB8GMD0KoCy3Vee4FrfPQxCdhl1HtILYx44kA6klT
	 +aibn+J7q//GF4bguWXxuQGMks1D7fQ5CYMTFwMO4OeEpTV80XcT2Ieo1sw4xz6oUOLo4
	 ogtSRfu+H2D1kNktHOD0ZkO0yeeUhAsTP1Kv2XCkwi5ONINnCTUbu5ARqjF6+SsHkag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mxrq5ZP2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YvKlUgUO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C58606A31E
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 05:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86C58606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mxrq5ZP2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YvKlUgUO
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4PWmS655650
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 05:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IYwAwKNsQ3Zd8ZLk9m7XPS8i
	lKZ84ltU/SVOXi75RGc=; b=mxrq5ZP2SPnzmMiC/Qy696KseD1ZZy1gapprx1mU
	zN/p4ufefQGsT1/fkhjgx7wuSqBcuyBDgjt2fZZ8OSt76nRpeUI1/HLQcfGdDUCo
	RWw2f+u39CrgcOIkt/stfVvRTBVpBWhm8+32a1mecHUZxxO1gr1+ntETzfdc4Fwf
	yBNmLmFK9hpll2pnVKxQbl2SnIfatRZEVDfG90CBE9hPvYS9SvjW8859JIPOT0oB
	jDeGM8Zx9CGD9dGsLi3t8Ch/vh7NTrLgxTcoSUso2ZJsLi8VhZZWMleX8/2e6pys
	jYDviIBiopLaauIsC+viTaxu9+3ZICjOI5HHNbWCc3TvGw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7grc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 05:52:14 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1665200f4c2so1094398c88.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 22:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793166733; x=1793771533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IYwAwKNsQ3Zd8ZLk9m7XPS8ilKZ84ltU/SVOXi75RGc=;
        b=YvKlUgUOCFN0Um6M7SsoFnS46nPqCpb8MD6PN/fnH3Fb88HIAv9OL2D08m92eMlJNP
         NC6kHKlMsafI/UtBrX860eNv46hLHKUUOiDtC0XdjmTLU5lN0i+cl9Hiib9HZY22KjDQ
         7irI9xIJ3ry2DC3r89g48EzLpWIC++D9dQ6sqjbxbPCa41liMi6sG27kh6tvsWqN2AOe
         tDmzTIR5n5UPViAUMBNPGePx3tfs+C3L0R3aRYPxdLoboSY051iVdGx6krOtDw+vuy1K
         +vq46tPcCj31/p/RhUYxqcqr00/E8FPEHoc+0tjKUi6O4W1m9ibGrOj1lqxZErcV8UVS
         9PGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793166733; x=1793771533;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IYwAwKNsQ3Zd8ZLk9m7XPS8ilKZ84ltU/SVOXi75RGc=;
        b=PvbcDk3bQQzgSSfie/ZMK0VeanFg3QPiyqDVFD8kRWv5oLr3ah1gKXjYt/ejFMOQ9Q
         R7b+mvnizH4vx4ilbhwfE4671jM8voE6juJqnAkWotAlvsjQZxRB09YGbBcNyDBD5fWn
         ftRMeTSKJCyzm3JIdMcJEmVGPCHrYvA7lbhj+RDYXwQxImQ8qQTnwzXbWsL/pROBRnhG
         UmWbXW7/yZ0jN3iXTQeozvp+s3wko55HlynqWnH1xzbwyw4tURAXDz4xntL9M4x7liwS
         DfAYCVQ5s3ZXdLNnbRJ+DRt4muP2E4b9pZzEHCirusuSv/+dnYLZVepve/dGTampkH63
         JKYg==
X-Forwarded-Encrypted: i=1; AKwUvBwDuVMasdSJ856G5CDsAE7nNDzZjas97rOnUHzsFysrLioEArWhs1jHnYSG/saIEqrBVAnpn5ip6t9l@vger.kernel.org
X-Gm-Message-State: AFq9FYL4foDawH8zuk9M88JNBwkNN5iyNyRVZia31+1MuSLssamCQPH3
	z+CGi8OjSVtoFyZpVNs2VjPh2qu1HYpKJdYke9pbMqrjtzzpnOxpb9WGZR9gw8/I2f3ASERQvBY
	+wGyY3BwbvONnzzALyHr8G3X6Cg3lTN47Cr3fYz0KOwb2VAZH+4wnrd64z8VpFb4g
X-Gm-Gg: AYBFou0mXIJCWQKBmIKqVqUDJ9Bdu9Hx4YBnqBem26AoExusUy45+Ny7AT6q8SH624+
	8Kac6s05lEVyBcTL5x6XvkkKES1xIfU7glupxcggsMs4JEOYcZpzUk9TwV3PboyZACDNnrvvGqV
	jZvKHUsCe2denWLhQ/Ty97UQb278i/99lMXZZkpkl8w0plvIDoi5+tSpmBdvHIvEYuXl2FzbKTB
	j2Gc21zypNWSgBwf8MgX6KjXJEnvGirCTdcLo5IhLVoY9xScWyWKXC+RGQSKOCUdy1gqBxiPYUq
	WISy0HuqxnoZusV1Ru/ht6wDOIT1eQAyKu6ayoK6R/B4K1/by5jHF2QoUkx9xWm5dihHpDzaObL
	W14r7CFgYNXJKfGCc5KSDrDti1OaaJ2OoWARGcbGDqT/iaFzyiEBE26YQshdnfrG7s8TtnZD9pQ
	ozrWr+GLK8lfhhgQCpWbQw/NkB0ABWzE9iKMkBCKYcvsd4Ggd+1zJCrorshtVB0e67jUXu+DcX0
	eTQIw==
X-Received: by 2002:a05:7022:5f1c:b0:14c:efa5:ee7 with SMTP id a92af1059eb24-1a6cd77f303mr1693490c88.14.1793166733321;
        Tue, 27 Oct 2026 22:52:13 -0700 (PDT)
X-Received: by 2002:a05:7022:5f1c:b0:14c:efa5:ee7 with SMTP id a92af1059eb24-1a6cd77f303mr1693465c88.14.1793166732662;
        Tue, 27 Oct 2026 22:52:12 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d76814bsm2295526c88.10.2026.10.27.22.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 22:52:12 -0700 (PDT)
Date: Wed, 28 Oct 2026 11:22:05 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ilia Lin <ilia.lin@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: cpufreq: qcom-nvmem: Allow generic OPP
 tables
Message-ID: <auGNhbKwIMGsOsbK@hu-varada-blr.qualcomm.com>
References: <20261015-opp-v1-1-f18fb6f9bae1@oss.qualcomm.com>
 <20261017-calm-tangerine-marmot-2e8bfc@quoll>
 <athPyI5nvYG4vmfl@hu-varada-blr.qualcomm.com>
 <cfc75bf5-eb1c-4433-a4d0-770c56778392@kernel.org>
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
In-Reply-To: <cfc75bf5-eb1c-4433-a4d0-770c56778392@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyMyBTYWx0ZWRfXzErAgeaH2UNs
 gMi75rY0Ta4frGa1toUn/S0U4NL2forKvxFUerxQ2g8G82FQp8mUd8BSl7XQJpDbs9ivvmNW9C0
 rvg95oggDbXhCBwv/rpFxFwWpJwUv1Q=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae18d8e cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=g1hkF5I6mjiIX44rm_4A:9 a=CjuIK1q_8ugA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: rdYugK4K4vV1mxsiw5mZYqQPoBCG6V1d
X-Proofpoint-ORIG-GUID: rdYugK4K4vV1mxsiw5mZYqQPoBCG6V1d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyMyBTYWx0ZWRfX8l+N3gh/XM8y
 0iDZZ5z7GmZoXmeJQni3KF4zvRG2mkMCL4cw6uN4yX6pYtviRY1o3ncL5vCCUuYZpFoulyatrJa
 vbgdXY8C8O5NJyQwtOSLWSbqax/vqJsdy4gfuzeZqK40RqdfF3w3TsPe7FX/5TCEew0Eb+uUoQu
 Np5yK+PNivM7fcOFZvHhQ+qjANfRide+fNslUARn4CUV0bXMnlCh597wIUGIG+w9C7UCnKAqrWM
 7XZJU/3DqFnzqzloSE+94eCVKw0dTLJG6dfAi/dLWIVb6D4V5YyMojBBjL2Hi9ghTGM4cwQV5H4
 +cLWWE1r1UMlh/QGNgQ/WfXiL8RiSTG4eHpNaBsCOEjuYBUqtl9veWXV9jfGUVYiqyBZ6qC8E3d
 hI35/MALbIPBDtXfCIllF9x4FGEwKWmKKKvDjTEdk/xfTAeCIKJLFy/N2nPwYMdPMdm0axVytCQ
 EVukVAPl+SWIeku5+lQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280023

On Tue, Oct 27, 2026 at 04:50:56PM +0100, Krzysztof Kozlowski wrote:
> On 21/10/2026 07:38, Varadarajan Narayanan wrote:
> > On Sat, Oct 17, 2026 at 06:45:53PM +0200, Krzysztof Kozlowski wrote:
> >> On Thu, Oct 15, 2026 at 04:25:28PM +0530, Varadarajan Narayanan wrote:
> >>> The OPP table node-name pattern also matches peripheral OPP tables on
> >>> supported SoCs. However, it only handles Qualcomm CPU and level OPP
> >>> compatibles, causing unevaluatedProperties errors for generic
> >>> operating-points-v2 tables.
> >>
> >> But the select should not select them. How can I reproduce the issue?
> >
> > Sorry for the delay, it was a long weekend here.
> >
> > With the attached patch, I get the following error.
> >
> > $ make LLVM=-18 ARCH=arm64 CHECK_DTBS=1 qcom/ipq5210-rdp504.dtb
>
> OK, I can reproduce. I wonder why do we need qcom-cpufreq-nvmem.yaml in
> the first place. It duplicates top level compatibles and opp
> compatibles. For qcom,qcs404 it does something useful - enforces cpu
> power supplies. But for others?

CPR capable SoCs are added to this bindings file. Not sure if all of the
SoCs present here are CPR capable. Will have to check. However, CPR
capable SoC like IPQ9650 might need this and will face the same issue when
I2C or SPI opp tables are added.

Kindly advice how to proceed.

Thanks
Varada
