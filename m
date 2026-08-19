Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E07237DAAE
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 03:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787108427; cv=none; b=O4etKFLEGC6wqsPIIZlSMOkGjeYirtZJErH0GlgDzmugjN6xiPg7G7rq7t1sQ2ledpOxYe7cZoexBshCSTVdZGJCvSnmH/+JK/EY6hCUEyOpbrUa/hVn+nWAfXqKs+W2nZIpxGRqD/N9vbBCg8Cqk3UyPQeb1/4Nq1M0EN0CtUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787108427; c=relaxed/simple;
	bh=u5zrGWxbdJvOMrTsAW4beCXv0zNPpebDufYXroNLSbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e20a6toeLndoUrodaMp/FAVHLVBITEMo3ns6B8jX7QEKV6ql94oG+z/T1VVVgfZjyW3Zdx87YngL8Urt6wqf3O3iMPmJOKUWOLg8hOid5cgMAuRnknZC3oSPeureCNjYGB520wTplJJShjLrt9wo/WMNlKLAbiQp9hVz/B4RWWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RpWIqx3Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HsLwQBnt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RpWIqx3Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HsLwQBnt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J2ldv32735575
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 03:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RVXkM6h1x8wmxO82Mfxg/gaB
	JOGGT9mo12ibYmRp7HQ=; b=RpWIqx3QG4Qm9Nc4tYE/jVg6leSuVdVS/DkBasAP
	mhDSs0yd/m1WY5KE154qWQ4SFlTvwMN6S26BYxWN4m+V699mMgVwFRLpwhIPRcv2
	WJ9g+rvDSxhTNKCiqLPxjRZ8KFx4v3gxEc3rn5vvTUx7D1RG9A7PORzGuQnhlviu
	sU5XkzZcVzsMJ3PpA+bCMooVyi/Hlk/0Dwuv6YY0yI6RDmwEsGHC7ypnans+pmIa
	bMXu0oluu7VJqjHWL4Nb3cQZL4banlN8EqAR8bA1g4fAa3ZG+Js5bBCNusZ6KD3Q
	j77w+9nM8X28/eL44KId3qCWFGG1YWeqavM4fj/oxzb9qQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm8yvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 03:00:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-933023a5980so93596485a.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 20:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787108424; x=1787713224; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RVXkM6h1x8wmxO82Mfxg/gaBJOGGT9mo12ibYmRp7HQ=;
        b=HsLwQBntK+8Ey6RL9MnlHi6s+ABtr3ZkchZ851VW9WaKedqLoVC6w5QMWww/PnyAhS
         +gP7qAUOz4gqBW0MhJqbZvToNMwqIlVu87YBXrbdkyihe/xq10JRjRjXdW8+nlYoXcZ3
         WwKnKrFEsFN99JaTghArR8kfyrfyhSY1uopEg7VPqEhKFGrv/srRlKylVkIMBu6ruPFo
         WZYH93PwUx0ixROBErzsK6GQFxOqHkr4/IHW9+pW7Y0vq7GAr/VZKD8eSBRFzKB7r/6n
         cRu//1JGcsDNeLsc1qncKKkC1GWWmKRy4R1z6PwXn/H06NmTvWoNS3iL1QSK7k5tGvqM
         T+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787108424; x=1787713224;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RVXkM6h1x8wmxO82Mfxg/gaBJOGGT9mo12ibYmRp7HQ=;
        b=QDCN64TMp0Ft/9A1EEQSvGCAl9bhDa9NJzAZcPMBba4lGxK2UETA4bDrsdCdK9Lpo8
         DFmaXlyNqoMXsvZW/19wm6BfgJIxgkDyY/vZJmBPX8d4llRhEbxpwKPAt5RQMxjZP+uf
         LCylPhma+M9megtThdohqAudH1CuMQbhC44UFNes0ksEAmgMuWv/pCmzdbsKkGeCb4+d
         Rl3XVrL4AuoQN+elGIxH3KhfL4SaiTACI4xrfk9DaM8Bnea737oHyAIzzUeJE/Hnmet6
         +Sa+eGKZ5sWXePyHBEbEo6cyZAnF+T+4MDwTB1dOW3Fn2pm8Fjgh5/4icioy0POHYYYU
         umqA==
X-Forwarded-Encrypted: i=1; AHgh+RrMD7MbQ9Tz5xK6ZKIKo/tCAaSFNVPBFoGBn0zMm+qQwlv+mtxuNkENZOsInho5TIZwfHGRzV1tVRIY@vger.kernel.org
X-Gm-Message-State: AOJu0YwaCazyON3YkY5/aat7FH2hkZ8pr/oA9axVfon5PpXB7mJnAHcX
	z53w3FdcAG+qf4XHq4DtJOJWAezfYbo7Z/FJSdqHVo0n+Sbc5946OX6xaoWxqRmGsFEXR6oAWeI
	vnmd5THpTH+D9jl+8HgWpFcRZh0Fg7siQVSdunTueLhZFFpybcoczUUJsUvu13lrG
X-Gm-Gg: AR+sD13rfoCYIUoMO6LoD/nrlfejnSD6JxbhyyPiEmBiAEt/hxhk/aEWHBMokSUXKNm
	11OA0NrXgolsE0uazIQ6LR5CZhqiNweMVRxDeENywSdoiYQ+kfURGG/dllHWj4RVMobBdYTekij
	EZTHc3FmK1ijLsoCLd0svsqY7Do2wdCnltofcjmg1R5XMnBsNmQeyhtEd5spt3nO0aaEDIKoxFd
	NCiXGQ4F2EPNM2eWpqNSSNN/opVPTesNfYTdBx8LMPV4e6KDJi9ws9ek4jetNBgpvpe82EkUJCv
	oElB7U8qyVr4SKdwMD5s9nBCqVLF4bdbseKU20jQZ+AuCvYrgpTzmk+Z2NjMGArWF7vyJQT673S
	5oBN0gOiXV7igiO4=
X-Received: by 2002:a05:620a:1712:b0:933:a17:c0c4 with SMTP id af79cd13be357-9371e1de2bemr162851085a.9.1787108423490;
        Tue, 18 Aug 2026 20:00:23 -0700 (PDT)
X-Received: by 2002:a05:620a:1712:b0:933:a17:c0c4 with SMTP id af79cd13be357-9371e1de2bemr162846485a.9.1787108422812;
        Tue, 18 Aug 2026 20:00:22 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14b7d4asm1797472f8f.21.2026.08.18.20.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 20:00:20 -0700 (PDT)
Date: Wed, 19 Aug 2026 06:00:17 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org,
        bmasney@redhat.com, lpieralisi@kernel.org, quic_tdas@quicinc.com,
        danila@mainlining.org, davidwronek@gmail.com, robimarko@gmail.com,
        linux@gurudas.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.vger.kernel.org
Subject: Re: [PATCH 06/12] clk: qcom: rpmh: Add SM7250 rpmh clocks
Message-ID: <tq6aojc2etmxyyxo7bdryzm6ayito7l4c2ja36rvt3nb327m2t@imznr5uqbojx>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
 <20260818080754.4362-7-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818080754.4362-7-sreeshankar0910@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDAyMCBTYWx0ZWRfX1vS6UsrGsnjC
 Wj3G1eIDsFED2iEFHDewevC3QIgZ4QeU6Ig8N4usvCaUZFnU+BSgGJ3im6GXNWIh5bXrl1T4fPD
 lUXWtKcy43j76VFUYR5WlzYkCZ5hb/NS3uTHaUxgVcWD5NxaYhVwrjjcX4Fj/zgOMmK4Z5h464/
 i4fvLrsHw0FtEvhompLrP7UC8SsQrOaS4vzhXLqZzgx6KfeIqDKF9iOG5XI3k2UZSiLzR8YXGrT
 V1v2xIUcJogFVAHLpBB39NqW1K5KTtWoAAVezQvgB8sMI0OB3MyAZzwJZACCLSMwf2Gilte2VSX
 PgMOnHhLyRScwv2qJDn3AyjxLtcPJrUw3wIh3pYm6KFMACI1uh4xrs9pwgNCZfBh/xsoATAlySt
 MNsU6gjLxZrwrQwdgosV0eJGHqx0RZfXByCnJnmjhvZX0eU37vlCgPIuR0gwEu119uFsrrof1DL
 CHvkpEBqoTJmbKA2vAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDAyMCBTYWx0ZWRfXyhCMgue/UCh/
 T/o2SupRLpg3jeGOWznS9spVkOf8u0ui5ibHHV+m18MmZCuoIuq2wv4NZ61pCu+cUinKI5dvW6L
 XXK+P62SqtcvvEH38oCItKuUXPxswCA=
X-Proofpoint-GUID: Kp8eg0-yKfvfD8nJDaPaxyINeGby7UCA
X-Proofpoint-ORIG-GUID: Kp8eg0-yKfvfD8nJDaPaxyINeGby7UCA
X-Authority-Analysis: v=2.4 cv=J+SaKgnS c=1 sm=1 tr=0 ts=6a851c48 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=e_63XvbMukAsnnsCD6UA:9 a=CjuIK1q_8ugA:10
 a=Z0LeWUw4VpMA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190020

On 26-08-18 08:07:48, Sreeshankar K wrote:
> Add the RPMH clocks present in SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
