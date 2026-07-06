Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820E93DB63D
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 06:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783320753; cv=none; b=nk2s+aOhsxrh3WtsA53NAl0e3/SG78Htj74VrIkmIdZh3cnTZCD3itukOxU0Ubg3hEDJ+rHFTOpXRtGPvzNeRKMyK+BZ+TguuOIsQzMpq0TLdAKts1fTbTy0ZRMKEQM7E5aOSyq19N1kLwBgVYHHbT6PIJYRGivZiKzXWU77QdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783320753; c=relaxed/simple;
	bh=qqmxe3ntthYAlQ7k/vISA8CLGMvMEMLypBSimLw/F3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZALdf0GKOVxN69Q6vfr7ribEZqC6D9c7tCFGGaMyT36aNXr0IkRfyYB10x/hmXfkdr1lWvjlt9JkUTpZ2z+pZIQlHNrLcPzdr66cJgqEuQmJOn2Yg6Qve3U3lgUtsxp0hcWZvZmKgO+yhPyVOSyzdC2IsQVpM2aAZ8tLWyq7aWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZlZDOFDV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UU3OKxH7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZlZDOFDV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UU3OKxH7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641nBp3624728
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 06:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yduyzXVW89HhFsw9dnAqLvcq
	vsISzOjplnij5DJTHWc=; b=ZlZDOFDVmf0HznMEY9kgq3erv0DgPIjglO7YLCYX
	Iye2x6pZ3d9RdjlXdccH7dSB5kySTiElJZVEdJYBganaFk9G40gmL5bVkr7BY4ij
	uVFiwWEErMx4nTe2/ulipIR/iZkzPe5MKizrlxnxzMcXuRraZbOVF1dyCjpbjGcy
	7W8UrrSx/asaQb2a/OtvpTNgSa3niGxIO9VjZmqd35gLeDq3ZY5n+JNfwRDwZPbk
	d77E7IBXfp005EGSfLa9eQC/09LhNHl+pvThEo57DQ0gMrdoCNl1/aUcaouMesBC
	fV7kMXDjLrJt7AZP1LGpG/GqSpdyzr98CuxZ4B67feK2HA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4sw179-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:52:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3810fcd9adbso4080573a91.3
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 23:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783320740; x=1783925540; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yduyzXVW89HhFsw9dnAqLvcqvsISzOjplnij5DJTHWc=;
        b=UU3OKxH7ccPpsB+EnYzQbUGc1ZxqwIrDSmd5y4kd2+PVuvgW48WRNEeleYqp7/QPSj
         XWC0H1WyLoPcgAK0aMaH7yXHSSfFZXOir9DPJFOTHUp1ooN2zjTv572HQE1jxppNLlcQ
         wyV5v4GOsnB6ZM4gcwRYtQzlidZmjJROoSjRV4uwvDpeChUSn1MflKQrytk94w6fEzwg
         +TMFAKI/msHnQha4LNs0jl+MxSjJLh+N90WdWMtvsLIIs+EhTKdD4FbHCihXyDNcibWZ
         DfHFVc+zM/5BoEFvtZMPAUUcE6K9sKNpZX/gkj0bvMJnTX2gMTg56uCwVZMjDttl4swC
         U+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783320740; x=1783925540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yduyzXVW89HhFsw9dnAqLvcqvsISzOjplnij5DJTHWc=;
        b=PVVVlWK2fm/OPvp49003rn9YqLKMaEI1Mux1MWW2A+mhbROQyOP0/Yivl5V/1Sx8iq
         I6ZYTxnsyOB1MlExgbpVkbik66DwJv9hibOoGmj8Tbub83HlW0h2S4wm4/TCleOIu8EK
         msEhw79R00Hpn8BxWyqH2XkK+a3kyOqxDXIXmks7vVMXmDA7+vQM7j4PF+DylLViLVtK
         ND5LBDYFzwQGo1EkYtLE1sqgdQ5+h23ByMTZMeR2csfYgCeMMI51f67o29ts0io1YcU0
         ZoEFAhyxZAfp30Rk8R2Si4pZivlGom2S5rrBuctmI5TiwKDpIY1hh0HkQ8bYi6ulqECx
         1e/w==
X-Forwarded-Encrypted: i=1; AHgh+Rr37DfX7q6L+dOq7fyRATC6iRZW+GWE8RmE1ttjwYtpKtpPqsQy42Fv5BMbnN9bn3WAXKashZTY9XK2@vger.kernel.org
X-Gm-Message-State: AOJu0YyOV07eW0pcXXrO7m/tYwzCDm4MVWlD+YJRcL1K20zh2b7q/Nw+
	N3KlJWClbrX+CpQEmP2qx0cYkaPu3efQy7t/QX5zelD2hfrfnhQp4AXOOhIsPQW32T2kkFRWkaC
	wIfgdNK5gpoDXwMtqlTxqA/6o4JyZG70KHHeqTfaERDuhe5AHiRwPzrAN6E8rr8Rk
X-Gm-Gg: AfdE7clllzA2mF++1dQNKf5G34jFJInMfWcKFFZYHpSQuLy+4K3X8C1bBAefjY1U3Jv
	frYQRhKa7dZj303OhPEZiDf+/6Ua6kYXhrME0Ov5y3HMz5AUAQ5dmIK1pjDz9ckzAAQM5NVjWJL
	OxsDjjUs2Bq/2MIt00ehx5PVZM7XUq+m33yGEkYcSMssy3mzw7yg/6jILqNS4rIRQgnuf617VFq
	apDAUnQ7VWhGVLUHYonQ9vg5XdOdc3pk4To/ObhgAFOqkCoSgcSAxspJlCrm72/q9kVjBWS0HNw
	cadX2msadlLxEQvoHuDVyPJuwieupnug+q6yzHH2FvKMzbWWb6OuPNlJH6PT73UHB6nEv5o2Xdp
	Ide2QrtKe5OzYmHeSqcOov3h6PwXo0dAdAR8NUNTniFxpdE0C7qYLQR0RWZKo
X-Received: by 2002:a17:90b:2687:b0:381:50ab:1594 with SMTP id 98e67ed59e1d1-3829f4f060cmr8881299a91.27.1783320740088;
        Sun, 05 Jul 2026 23:52:20 -0700 (PDT)
X-Received: by 2002:a17:90b:2687:b0:381:50ab:1594 with SMTP id 98e67ed59e1d1-3829f4f060cmr8881270a91.27.1783320739649;
        Sun, 05 Jul 2026 23:52:19 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f4453996csm25684997eec.17.2026.07.05.23.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 23:52:19 -0700 (PDT)
Date: Sun, 5 Jul 2026 23:52:17 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: add SoCCP DT node for Glymur
Message-ID: <aktQoeo_0IGRU9ti@hu-anancv-lv.qualcomm.com>
References: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
 <20260703-glymur-soccp-v4-3-b706c4c9b3e2@oss.qualcomm.com>
 <akra6zR_Z5_D0xi8@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akra6zR_Z5_D0xi8@baldur>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA2NiBTYWx0ZWRfX23ucHYW9u2zE
 Fc6cJtQJP6u/wUJ1Pon2DUI4qB1GtN3q2cq6anRc3ZuGawQ4Ec2wot6kwAhocJIrcZNUJ2LXY0A
 ZhBVThO1czflJOW71nEotLt0B6O7HTk=
X-Proofpoint-ORIG-GUID: x6v0zOw2aMapfrK5DOSwgdQQz-r_e_df
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA2NiBTYWx0ZWRfX7Y7b1ptq5R88
 dnb6DfSOxoMtZsSaoeYNISEs22Rp+GsvvURFXPKa90x4TeuufQwkiejZQfsAuzTyEGJ4+cgh1UH
 7oz53N4SDyf1xa3uYzYsKtoCmipC1KJgtYJAyqt/r9zijorClA5Y+MRUeX7TY+DAX4RkBvaJ1xT
 TTW6ZcIjpx3vAb+y1U6ID0kSTg4yUtd8sWDtz3tFTDCYB9SUHgY6WE1hGPT6nxPcGHocTibfDm4
 4VzpcO4Gds7l8MuUbCrcCCXapBf+WvdLUd9aBHzQvG9fHGQvEf1tkV8o5t9+6a3bv36O0bq8zrX
 qlAQD8PP6Q/K4OGl1Pxp+FVIEeDvfteIOGCPxsvoJiSIRFfL0ZaZJ00ZL0bcu2qklksoXbavt3q
 urapwECWNrsvOycHxiX10o1U9nZZPWpDAPZizSoQk0inHeXC0/v5o1fRD7OE/tJOXniBM2A7LTo
 vSIkw+4ct/5RMreS4hQ==
X-Proofpoint-GUID: x6v0zOw2aMapfrK5DOSwgdQQz-r_e_df
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4b50a4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=e9sLxXvMBOhUzl4J0l0A:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060066

On Sun, Jul 05, 2026 at 05:41:18PM -0500, Bjorn Andersson wrote:
> On Fri, Jul 03, 2026 at 05:31:13AM -0700, Ananthu C V wrote:
> > From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > 
> > The SoC Control Processor (SoCCP) is a small RISC-V MCU that controls
> > USB Type-C, battery charging and various other functions on Qualcomm SoCs.
> 
> This sounds like a good description of the SoCCP, excellent start of the
> commit message.
> 
> > It provides a solution for control-plane processing, reducing per-subsystem
> > microcontroller reinvention.
> 
> But, not only did the first sentence come to a full stop, this sentence
> is also trying to describe the purpose of the SoCCP - but the scope
> doesn't seem to overlap, so this seems to hint that there's more to it
> than what was first established...
> 
> Please fix.
> 
> > Add PAS loader for SoCCP on Glymur DT.
> 
> And once you have established the problem description across multiple
> sentences, break the paragraph to give the reader some
> breathing/thinking room, before documenting the "user-visible change" of
> the patch.
> 
> Regards,
> Bjorn

ACK, will improve this commit message as well.

Best,
Ananthu
