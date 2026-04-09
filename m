Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE6937187B
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 07:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775720892; cv=none; b=tSdE8OeBrbSGouybUCCOsWF4AZDucNz2WcwexjcwK9tHTxuzDDLCrcEjM7b7hEhUawaLgSQOjkDaDnTAYZ/xmEU8OJHBgcfj/drVsCZH+vgIk0Ox+NQNQpFhXpi+9skfrQ2Vus5nSzvoDij1skcmEhExR0lyw5lXksMbRrz3Z80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775720892; c=relaxed/simple;
	bh=ZoM7TDWvbqDUnnXcuUVO9LsEhB1Raczmr3T+PIhxzbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eEY94bpZf4F/yP0T6K8omdnoeQV5dMKZOOyBe7BHpm+ORL49M3XW5m+PfYwiPhXcodzpGqVVgD7zqBE+XXCc7Q6zD/8ft+BdwEIyfWYVnnLzBz7umuKmd/ZcGot2rW+HVzfO4k50+YhmJB/MPKw1XAyJNsg7aUqO+9bN1qlDDc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VUnecfzA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rhmla1JX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VUnecfzA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rhmla1JX"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6394YmSq2614568
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 07:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=a1B9CdzhUeVmz7rCCKalzgKO
	s0sz2BeqY4Qic/Nq5Ks=; b=VUnecfzAal7bgmB3bk8QpJDklOwNTiZZ1BiKex0a
	czfw0HMDUBXNLZQPhjNzvFJWOyHpKIPJJ0kbeFx4IVyh+EJGmEFJiWkhl/V4LI6u
	CyrX0rrqtpU+k8jRypBjRGzuoFMd6pgEPwovggO4re4Tpnddst5lHbh1d4FGkSxV
	hL+NyXHpmBP995CqS80QmahbA49t2eTXKMNWuwzdO5sBCj8TbZPexPrsmU0+Zf9H
	SLJpd9KpLq14im+ne78PF3aBPuilP1VsDCburzV8KzGEF4JqGqFppYN7JZBAdAzx
	2FutUbMjHiuJ54yXnlUqBXMX0qkXYFIOOp/uuu8mGYYTog==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt28u2c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 07:48:10 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12737f276a2so10445320c88.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 00:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775720890; x=1776325690; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a1B9CdzhUeVmz7rCCKalzgKOs0sz2BeqY4Qic/Nq5Ks=;
        b=Rhmla1JXrgsNUQRE3kXx1rborojvpPTSgRo61uSBO7/4jsffXy/FzOWLcZmaCqpq7M
         CM1KrH39Pac6v49NmUa8KJ7nnQCr5DD0HGLUym4piljKRkt96AJhHTjylqgcqcCvU8Aa
         LC4kcvf00fYAwHbRdoZ/H5GleNNHIPiFVXWv2QVkDa+eAgHr15CX7q3QCQF9gnvQJOhp
         IxGM2Aq2sG/tlueUabVRrVsUkM3QZMCipDVNNVH4DhnY/OVhX5wDrq1llsI7qRTYBb5A
         y4H5Lbw9a0h9Ef9zyqqE1hd8+VmueuGOHRemqwjJvdDPcag3kJj/PxMg5Sabs3IX3nxC
         qjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775720890; x=1776325690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1B9CdzhUeVmz7rCCKalzgKOs0sz2BeqY4Qic/Nq5Ks=;
        b=g2Mu6J5ITvHGXKbaFJgxFntdmQd/0JNIfAxIJd6Ty3CQdYj30aMMKW7xAs38EzxIU8
         PoZeo1kNkao5T6Gua95TT5Zoa4BeSnwZKSzKJSKQgk1c37vaMuzJvxS9mbWGumAthfob
         qD7fwCEXwCcSMr/anJAp9TvSdvx7MQKv/Aitjcg6JTOPK/uJiCX9z51bbVpGbJSzcB/T
         TGaA7dS/MT1lYJFzBYrWL5wH/51DdzjZqEXcxP5j5KJa6bwAHED8cGV2L+WMktDQXNVl
         HvhEPslZSAxzzcjxZ5LLneKlYWVXvRHtIsKWj6WIXmt/SbOsdV+8oHg6uBaWymvVIw2p
         cwrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoq7BS9kH14vz6mEqsPRK1Z4z3oODQxBdmoKSgzA5jgbAhmcciJE/TaR0VkXEhXmyep++MZh7Ea+LW@vger.kernel.org
X-Gm-Message-State: AOJu0YzCXvVeamw4kCh9gMZWbavuoFjkBcsdl4cgM0J3b/aLXlk0Sv2m
	VMAM9ysD6ye6mMaovf7IzWXjuvrfEOQ47nJhvqlrwxHboLEjN+ghuWvd8XkbQ127VbuWQDgbMxG
	IzfRgoRAzOeGHFXv25khI9Rj5lxfMU1Hq4n0X4slHD7B4KtAx/zRZFjrm9sl7A45w
X-Gm-Gg: AeBDietX52pnJbi0VvZwN4s8yi5mY7kr1VqRiMvbFs5iXhNyiwksopEsve33SEJI60j
	Ko6y2C46pDgR4NSXD9Mbx9cazyr9Y2zB1keEWThJxNw/ah2n9J73TIajhdaMqfdDDTysSkulDpM
	oTZTtUEaMEoqlkmZMmXkS+8FtO8xyJOCIiUN3wW3TwPxqdpqPeW8bRoPOz9D3canK+1Zth7SfQA
	Lr8yZdi2j4Dr+yitsTJCbd9IgsW6uyNOyWalXwpckKkB6wlTSUD/EIC6DTBv9Ccw78XmRSpVeLJ
	3UHZ3s+T9R1huz1kJdK2TOg4BYFnlL2SPLMWvWUXUV2zY7huA3QZcgHRHEDwB9ogm76uklI3zVQ
	wRcBeH+inXOLDO6TCDlBgM3roaDZHGqmV98I2h0qYvhKlnTiLtyEU5YF+IAsxW6wH
X-Received: by 2002:a05:7022:62aa:b0:12a:72af:83d2 with SMTP id a92af1059eb24-12bfb7109c0mr11782541c88.14.1775720889810;
        Thu, 09 Apr 2026 00:48:09 -0700 (PDT)
X-Received: by 2002:a05:7022:62aa:b0:12a:72af:83d2 with SMTP id a92af1059eb24-12bfb7109c0mr11782523c88.14.1775720889230;
        Thu, 09 Apr 2026 00:48:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede54ba8sm28314784c88.10.2026.04.09.00.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:48:08 -0700 (PDT)
Date: Thu, 9 Apr 2026 15:48:03 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mrinmay Sarkar <quic_msarkar@quicinc.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: lemans: Move PCIe devices into soc node
Message-ID: <addZs0XSe5WMg0or@QCOM-aGQu4IUr3Y>
References: <20260331090147.18522-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331090147.18522-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: mPb-Y24sC6mYmon-iDTsTg3hlnUjEWbx
X-Authority-Analysis: v=2.4 cv=fIIJG5ae c=1 sm=1 tr=0 ts=69d759ba cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Mi0LQC5kIBAc4CHFT8sA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA2OCBTYWx0ZWRfXyot+KEMPJjFd
 /VBuDnBXJFboNaK9UQte3xoRhuEG2Kr8xVAhh5Y+OYN823xuOcfjk5fAjT/2KvpaiyY/vwYJ4b5
 5s9yNyOFlHPFJPbEdUwSShjOmjCFTDy3yMtoBVQRddfLvHCeyWFRtbgqk91lEzVEV854W9ys6bJ
 5RQ7WuT0hGscmN+DPtv4lFMy04bhJkXI1ZxTWz/tMQuiR0xtb4uv40/IqtJOMmGvccoKQPnH68l
 bJXCS+XeIV74g9VHVKBrP7NWYUmW5N1ang3QQUluEeJUSPaDbWMEYFE90kONhGzOK0/Atp9/487
 cfo13NHLQc5mLmNjz6qr3J5s2Iv+4M7Kh/cZojB1vSshQjWoXAW1jKNtgWQAAFnUqTz/zTN8kqx
 SZFrHOdun6sgtEM3jSSsC6cJUv/XnA3F+PLbAee3NBDr5OANdDb/0rIvmNHqM3BzZJy+G0fNg2H
 ob3gqNFamMis6jay2Nw==
X-Proofpoint-GUID: mPb-Y24sC6mYmon-iDTsTg3hlnUjEWbx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090068

On Tue, Mar 31, 2026 at 05:01:47PM +0800, Shawn Guo wrote:
> These PCIe devices with MMIO address should be inside soc node rather
> than outside.
> 
> Fixes: 489f14be0e0a ("arm64: dts: qcom: sa8775p: Add pcie0 and pcie1 nodes")
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

As this is a prerequisite of my Lemans DTS split series, I'm including
it into the series.

Shawn
