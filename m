Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8B018AE3
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 00:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783123624; cv=none; b=szt420kQtib9sB0c8A2YJbQGMMsWB48bSiMTvcU39ps8dSJZi56JwgVUiADKJX404uAy/lhW/w942wb8hcBxNksb3QqwuEqLnGpKkmvPR8IHmb4Zv2oILJvpJ5gpJP8OUYDjdj7BfaiFxA+CgJUuAQGCTMC/fCNbYl/uNXos+Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783123624; c=relaxed/simple;
	bh=BEogSRGJNPbF8wmvoZiqLfnguBw9plhyfs+jR+zpRe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HD1ws10HHLJ3z+p4y9+NL3L93a0mqy8PLGc4C03AY+EU4cv+6jYltdtfQrtoUrozI0WyzbsRaq2QCxaIq2F8JJjEX7ur2yRt2nVwsTOoKwy342x1kTtIgjcgemuX0po6lemVNDvN8dwfYnYxFQ3VAs2MutA2PfPsGs+zkJQTe+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+43f+T/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KQHxQrAz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+43f+T/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KQHxQrAz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KQOMv1032347
	for <devicetree@vger.kernel.org>; Sat, 4 Jul 2026 00:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f3Ta+pCtFjN52t4dGBtiweKL
	a21WuFYkkIm+cxb/tHA=; b=S+43f+T/KMK7tDli6vInt18Owr8e9xtn2v1C9kC6
	wS8wVfGLuR+S84IUdklzv/ZF8r3Q7YbWPjm+DaaSbK0JGJg680rSioI4T9wMZIGp
	o95SRBOIMkkhx0Fsw2sr3CvFcIy6cGo4cmrc0bPdK/K5BdncNlv6+S6CE71W0ubX
	p6VI3feGE/jReb62GTUM1idSigOMBbLgr+u0/WMfslbX6e2I6Zc5xSnhvjYqMKsW
	9H4PyYsXuSmau703ySxYmXVeqcxkZipaqHPuvFes+IuN4TSNTu47xGz7khMUbDgp
	7Y/cDUVJQsyHvzBJGPuflD4rkXSqqfxAgzw37A1bmnN19g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5ca24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 00:07:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92d1cae5939so107866785a.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 17:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783123622; x=1783728422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f3Ta+pCtFjN52t4dGBtiweKLa21WuFYkkIm+cxb/tHA=;
        b=KQHxQrAz1uv9AhaO0HVVrgo2S7L+0tN/y0dJDGEjfMhisANoln0T4Qj92LMYoSoaow
         O1Ar26ip9lhhaRITNbokuHW9fvvuYztWfD8gNnEvU80vF8PAkxqEuFYhCFZ6AEElIjcp
         ESoMYSfZ/l3F1fCOZbrSMjPQK+sR3G9kZ90NVGnhZFLNrCqj6Wki7JYpR52vdTDnCGg6
         keVKmb/ImoLYHt0iOKdgBaD0DlKL+zQcCrMS/BK59zvGWkGQsxG7bxhg+Dq3t9ThSJYM
         RG3G2Vsp3N3VVFjPMXA0khv5JX/YIrmkoj/sbeWCCYjbfFlVeP5XZRgk9/1jsQ5henH3
         wE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783123622; x=1783728422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3Ta+pCtFjN52t4dGBtiweKLa21WuFYkkIm+cxb/tHA=;
        b=oW7wqZkq26gaGuutzYtXWXZWSiO6dEGZPYGwoijq81uYc0jhnYuwtwlMGtzuuLKEWs
         1jXDaA6poEWPBrlKiJVvCitsdFuGxwbawLw/ZY9o/8Vdz6zZNUi8u1eKUXGlJa1qf+im
         ToSUD07YbBMWSVSed7pB5mmXDqu3gQkc0SyuK3nYxIRPIjWXqUVQUsLBTqCYEOd6w8wO
         76A3ponM6/yC48PYSuTNec9Jnp4sOIY3qkZWAqnYOF3YoTq9kWlWhXg4zvq153x8VPyU
         Jp+AqSYax1HoAZnUSkyL6upMzIZgP7yCjRHikToR/BtDgBaJAju4+8KGl1wy55LKIgzj
         4YaA==
X-Forwarded-Encrypted: i=1; AFNElJ8xd4Myt32L0SsJ0gweSFfTpqyDEH6HWYm48/3wR14qqhVCbR9iuk7kd9J+hOgoc6BoZ+hCGvotEEge@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7ySDwRWTDFu7MLZAmiB/MKQR6KbETHvrKkx0gHqDq7Rm6OoGy
	lWxOwdpCj+d5ZrK6Set5OLXK5BiS2TvPeUYopvMYHFpp0pxjwNvGafCQytUVW8HEqbnN07OgBP1
	oceLWsZHhovMQXRln6pRxceyDFQttxEHkO0p40TkEGLGQyM5A6HmAjCa83lkFtZXU
X-Gm-Gg: AfdE7cnqJL4EGf4TtpHqdJnemQpW4U4RWsCdAHv2XKiwJ9foWHDuzOtRIv5yOwiQvnX
	YfWnX7miOS0C3aEosq3QFeLo7hdbwATemd3lcavPwFmcAID+JHe8dZOtlqyJrWKgTximZlxsAI1
	r1TXiSrFdaQv861fzWKzWve9qmqswN9HM+7uqMvRbVB2QFziQ/SOhWzIncfEycL6YFq4yB8Y0vi
	vAqpEWtOvLm/40SantXShTbKzvhVjnZLZ2y1mTe5WIJgSIWRfqZlwKHcIicJd1VSpy15p2ZoYje
	hM6U+37Re02+7ZnGWb26znidNBcNBY1RFN67DjdtyECKvz2sxUgCrK6gzRCAMd0Nq59W4AcC/N3
	Cwn07hHKTTzW4W95CTcVk74IQyp4xXA1Ja5KzgOeLNlyICKsB6VilO/r5EF/rJmc6m68R0kbaU7
	1exKssrMAebCy6RxKeRC94xrqy
X-Received: by 2002:a05:620a:29d2:b0:915:9de3:2260 with SMTP id af79cd13be357-92e9a3cca28mr230202685a.24.1783123621819;
        Fri, 03 Jul 2026 17:07:01 -0700 (PDT)
X-Received: by 2002:a05:620a:29d2:b0:915:9de3:2260 with SMTP id af79cd13be357-92e9a3cca28mr230197085a.24.1783123621256;
        Fri, 03 Jul 2026 17:07:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c8d0esm863792e87.84.2026.07.03.17.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:06:58 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:06:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/9] Improve Qualcomm EUD driver and platform support
Message-ID: <2r72aodgl3ff3gts6nwdmvujluehmuhlpxnvvyzshgwcvpmjiu@77iff5kuyo7k>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <35348aa8-f878-4ee7-bb96-a1d9203bca4f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35348aa8-f878-4ee7-bb96-a1d9203bca4f@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDI0MyBTYWx0ZWRfX/EVKHWAthhGK
 c+0SnqmMuvONrM8MAYSh5WSw9A81oWHts99pEGMWC/iouO2Pa2FcitlhzpzJdtAgGHTYMG6XnKO
 99C5/CadITfx807TZy7Da/H/wu0m790=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a484ea6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=whWooV66aUwbJ3_LvogA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: i3vptgEVA_M2oPZJslSi83xWlo-p4uA7
X-Proofpoint-GUID: i3vptgEVA_M2oPZJslSi83xWlo-p4uA7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDI0MyBTYWx0ZWRfX6Qyp2ihblWnz
 tRyQuQfp0LoVCCihYi3K5Le1END3u73qapKwSR14bbJSu975AoSpkRxH3p1c1JZjvno00pO60Ah
 K6I0I7OXgNY5acc3ScBu9+gZXyni8uxOioMOcsRslYK+gYlowPXD9iQTzdTmUzf2xWuBF6DA3gy
 an6OLfwSkhPFLC6vkDdZOaGOSjbBnx5m+2BYd4Vn1kZLzXaO2paJzv1WuO5fyHbDVQ7QkY188Mz
 hPjp20m9WBAsYC9pMo5QMjdi3+0LFDrDsOyLaXM3aWNHV/arccm29B8yFVHlbNl4KnxujW5k0LN
 Z1oPbT1ekQHCx9WYJCjvStaojDCuu8UZDAp8LQpNrw8lEbvZtVjcnN5qDxFyUuIcnU99NU0GrXE
 /QDP6lfYJQT+XEUQ+7aTzVPgh6na9byC1ADQOgC4w/CQ7/AEW7Ef4pxhRZhyGfUaCIfipZECqo8
 wl1SEDTt7rzINVsj8kQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030243

On Mon, Jun 29, 2026 at 07:48:42AM -0700, Elson Serrao wrote:
> 
> 
> On 5/1/2026 10:06 AM, Elson Serrao wrote:
> > Note: This v4 revision introduces a design change compared to v3.
> > Based on discussion and feedback, the binding adopts a child-node-based
> > model while preserving the legacy top-level 'ports' property. The
> > child-node approach is required because EUD needs a separate OF graph
> > per UTMI path to accurately describe per-path role switching.
> > 
> > Link to the discussion leading to this decision:
> > https://lore.kernel.org/all/20260324172916.804229-1-elson.serrao@oss.qualcomm.com/
> > 
> 
> 
> Hi Dmitry,
> 
> Just following up on this series.
> 
> Could you please take a look at the updated design and share
> your feedback? Does it align with what we discussed earlier:
> https://lore.kernel.org/all/20260324172916.804229-1-elson.serrao@oss.qualcomm.com/
> 
> Please let me know if any further changes are needed.

Excuse me for the delayed response.

Yes, it's better now. I've asked a quesion regarding using eud-path node
vs having more ports.


-- 
With best wishes
Dmitry
