Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F294AC162
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405644; cv=none; b=Drk+NI2ZYXiMau2WP+CjTmBzXRHvRPVWbgHEMrZB4sYY/3wJKd9DQr0hlOGXbHSAi/gtMjMVLixlrUZPlnlZzEmOgsvmYIIDwmiud0rwbRYMxNn2sZeqEcJmsJK5BvmErPkZE2SK0mtOu/ygoD1Xmve7Y7NdG6FRov1qh+Bm8ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405644; c=relaxed/simple;
	bh=G0TMCk6eWy1Ejr/Hn7WT55P5PzRQ/ZPO9noGVtE73JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lNv4JGM5xoAJm2ftqFVzEtvM5ykEYGoe5w9M/C1yUj3DPE7glWpfldVb1RxHMozRTJ7/ODnrCPf1rUJh4geweM7lij6XgAk/OH9Dvi4VZDD+066HluodjOMkSf8CQq5x0eJ9kGtVC6UmfFtGFuI3uoN1kitCj7qyuoICyr7bHac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i65CWnpk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bp4xJsl0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i65CWnpk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bp4xJsl0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P18e2042098
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=R5EGq4XGknk/rOZMg67W5T6b
	1dC8U3KSoO937QnJM5U=; b=i65CWnpkp3zl57e1ESq3D6aI+WdZ/ecnzxNJS43K
	EJYu/BX9E5a+DSaNLDFKqydOgC2yK8CvF7oH3N7vTLzVpB0lwFJePssQfv6MPBEK
	gMlmmNMkSoo0pPRPz1w/9Ugf3pQOvHz+CJQ0vW8dfm4D6EC/cFDes6Z4u2HTjbzP
	3EFPFVyMJA/rN6sLcViGuzhJ9bL9ZALhCmnbDr4Nr3j7m3m0teyAfAXmcL8sK/Y3
	CSNwPqP8O/hT/+I9KS4FiE0SMaDHLpQ3DEfYDiKWLTwa1FfLPF7NKKsTQsndEbVX
	GsFZ8+NaCn2jmjQHn04WtpCvVHjJQMuvxpTnulSYPCq1yw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur295h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:27:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so442122785a.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 03:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792405641; x=1793010441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R5EGq4XGknk/rOZMg67W5T6b1dC8U3KSoO937QnJM5U=;
        b=bp4xJsl0PryA0xaPYrxOu6RTiGJjfxDw5Nn9wfBRJhaDpYyflLsVQAVPwcTGS5lcps
         6UQ0/Ahh7Ic/tsNAZD/biExrHCpt7z71j5s8CfwtwnyC6kcMOm7EViu9HeJQ0r5AWw7L
         OAnFJzV8x8XD0/qoLcchWTxyC/K5tewtFxXicU38QJtQJHFAwcOhBQ/c627GjzmMN1uD
         smNQjzKH0p5ZwLjQ4E0vD4llLIkPVbm3NgIeSSCLC8aTyZovs/hDNtb9Ea2Fyz8zkpp7
         d6mrNfAMX7co+PIDMkXOXACN5kkDvhyaNF1aDEWYoUG0HoXLrgDV+V9Ls4B3WwiPbY3z
         pm+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405641; x=1793010441;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R5EGq4XGknk/rOZMg67W5T6b1dC8U3KSoO937QnJM5U=;
        b=NNeYlQ9SZtNsaVmm5SN8BUQJoN6y6S6QRJ3bIpZVm1EA5RnHwgzAHtSWW8k708k8fB
         GoQCmkcUUbUODal5fLRZ84v2NtolWVmkJAYoe/S2miP9FlhsSH8srTO0fgqwGa9Ao+gZ
         J4CzHQdMHJBwTgECvx12tS7BGcaO4eNtycYWX6aEo5YKaRz4OYdKbgCAzUld1667ZLfU
         fo+08XNSVzyHPYsq6QXc9ijSB0IOrkKcWQOy//Hp8bEtXnUGpDufb3UpM5m6wzvOiHdw
         aiPH7xCW9X24bpgnpxyf4Ga+QdGTFz0GcY07NaP4KMNts+Et9f2N7XyWWfzAxMqxTPvg
         ldkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxE9ODblXMzAZk6hibAZWsruh8vRNshiUNqLlXp5mICG33SLU1vScP/y31t4FqmUlLRJPRx9nwGyg4t@vger.kernel.org
X-Gm-Message-State: AFq9FYJaUSxMPHlkLTOQBZ1GRbq6vQLk0BxYZ4ANqVGaptt93Q4GuC/a
	hMyYLqlsHdVx48X1Cuf4ouze05kA+pJ2ALWl+wiEMGcZEQ/lXhZpTYtRn166oPo963mzYyyhhOT
	O+zR5/pi22eJy38p7owJwio22YfJ+EOCJBlR/n3+HtcIuS03zfqMFDxUcWpY/81Rh
X-Gm-Gg: AYBFou0e5gd4sk5CzKFrA4B7s6kfs32lj1WPohAMOey/QiQ8KFq00zMR9UlmYxFWOHy
	gbzGLDyrt+Cfge8YzdV7ikl43BmKiOKJpiakrupmBep/uy0fdB3TtNmNCLMtkbZGmQn6G90aZSS
	4qGkB6BWVDVXE9mnbPSCVdQcoY8tfILwa/mnFW38S8mDvqcMcfb/rw4R1w39nWQOL5LWFn7fVOf
	Bak1Ntx4EBu3PrAnFn+/Azdd1L+QdBCqf9TVoh9RF/7gjSP16omhnD3tuRSaMaucL6Mn2U1HHSU
	1Viplbukg/kKOlgb32054xH9FgCCG4Yncvu7hN9waQZgWAVlMRFIdwD+3qkIPd7xsdxCU7WT4Cx
	vmKMb7fBLdciSEpmJ
X-Received: by 2002:a05:620a:40c3:b0:93c:8544:6adb with SMTP id af79cd13be357-93f29c9716amr1228848585a.22.1792405641404;
        Mon, 19 Oct 2026 03:27:21 -0700 (PDT)
X-Received: by 2002:a05:620a:40c3:b0:93c:8544:6adb with SMTP id af79cd13be357-93f29c9716amr1228844185a.22.1792405640771;
        Mon, 19 Oct 2026 03:27:20 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f5177sm21895264f8f.30.2026.10.19.03.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:27:20 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:27:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sm8750: Set
 snps,resume-hs-terminations for USB controller
Message-ID: <4vqpw6q5tgivxp6fqkndblg7mztagnlyuglytn5c5ej3hmse5e@xqmioqeototl>
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
 <20261019021547.1694088-3-peter.chen@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019021547.1694088-3-peter.chen@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX1uYx14wvaV57
 I+cTLGQfgFQZwwUFj27XxuTDwSaqtmTuhJbCf+09b4ARB26z2uWdDglqKNS5gGxhy5AFJZKfaF7
 Kxs2iV+kA/EkgxqiOWNEehQa6ldqSpg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX6pikpCLatFN/
 qGBV5/Re7OuyDsBc/+4INTBCXr15860TnER3T9QAoaKzpsGSRyUzXQtOo04ZsEwMUYIWOCXj3dO
 8+xZAolvl1c11rXhwbFuyw4A+tz6v/0fXKKc42v76+rNt5FK/8qjSSCRsP+EBt4S/mi6EeLzrUE
 jvtU0AaeeLrY2d16BVhfAPR9HbdlXDCYbZdEPHNmIRV2pBcbdbcTJYNlvcy/kLJ8UmPWkqLovun
 hNczsRNI1h7ep8rg70t4tZMj1GfKZ2ix9Q1p8zCkiJl6qzwuK7Q4M0RZZoFYHvOO6yJ5cSc2WSj
 ohWsci/Q9fncynfjlTHF6Y7dvqjBiDG6+AC5f9KM21CUlC6mrX08/CrxGRpZt40lwXZFlw9eTYv
 B25n8kGxl34qRbDqQLn0rtsRHHaL4V4uibWUvNosa1SL+j1fC/ba79Pa8AHhpPsENrMOb1WcDBo
 9Yd07R/MtNhH5aFEohg==
X-Proofpoint-ORIG-GUID: 0dZee4cOpJvEwPRttIctADghYkfpJrM5
X-Proofpoint-GUID: 0dZee4cOpJvEwPRttIctADghYkfpJrM5
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad5f08a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=NkzuWOWtXKdz_VN5Xb4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190041

On 26-10-18 19:15:45, Peter Chen wrote:
> The DWC3 controller on SM8750 is paired with the M31 eUSB2 PHY.
> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> (RESUME_OPMODE_HS_HOST) must be set.
> 
> Set snps,resume-hs-terminations on the SM8750 USB controller. This makes
> dwc3 core set GUCTL1[10].
> 
> Fixes: 7a5bb9f60527 ("arm64: dts: qcom: sm8750: Add USB support to SM8750 SoCs")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
