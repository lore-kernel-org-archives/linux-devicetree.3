Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0533D34AA
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 18:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774290539; cv=none; b=k6hzQohWxEG5/ZqFSsnW+XbGbNbqpPnoW0lXehuPIq0nG3N5Yk+bqVdvZooQkBTPpXt1lJ1gqz12bbiEOIYaXXdlcHmRNzJuSYBhfkNJtUfskCw3A/QOiVqzHebnOEcQUfCpo/D8/GO1Of3fLXj2+dRIOqaBcFS5ac9bzHFB6sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774290539; c=relaxed/simple;
	bh=M4yLosb+fCuLCW+5c3f9foeV3Z4DsImHoVNwXyhXAZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NOiS5qnpuYMDIFDC4JY2zCKUF6d768t9r2O/8ZTh3pgDjQFNIrvjalPAdkiwUKBhDgQdtRwyTvDlcU1ztRu5HfvErIGVd7j2siZgnSs2sHuX8NMoFo4h7Ux8hRgsAHJEIH8eOcGThzoNYjUZAPtIE+MUvS6naWXqFBVsF3fji8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bxYj7eC9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Crpu37qi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bxYj7eC9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Crpu37qi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqi403817796
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 18:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+QLEMWavQsoDtJ1N3rXPKXC/
	51Eg1S4SzA5jQ67Ss1U=; b=bxYj7eC91Svu6wZJol5nFEezQ0y8I5SjG7MmyoAJ
	rm+EyJgHc/zQZnpakMrl4Z8FdG9wBiIJ1pfhHOveCB1Vh6Ot3z7JKUDjUk7iE+cP
	/MEat53Zd4Efnu2gQPdRlYV24Tne+V+dS7zjc+qe5PlXFqojRKX1VzDcw3h6jqUW
	KRpmQK6vUwoZYMif5U7PAK+YULRiLE52SYclLSdDDWNdnpkkXGrv5KGklk5z/b4X
	FKwUh4AbkQ59/DHD7YTvuXxVTt2KTP2nV5B52hbqR7blx5H+weg7UDjcpDU24/6/
	P0wP3V3FtuY8PsfVQL0Ued9nEiYr2zRr0PEc5BCu3Bp6Ag==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d355w1c62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 18:28:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5091a96f0bcso178730341cf.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774290534; x=1774895334; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+QLEMWavQsoDtJ1N3rXPKXC/51Eg1S4SzA5jQ67Ss1U=;
        b=Crpu37qiZaOmvRQR53axEa4Hq7N71mn52SZ+A6MsKIx9wEFMEjKo3IJANGo89t3ws3
         wxyyWJB1fXTcI3eiqqkbnmulAVed67+Ivh1YjQgFFzN3xg22JtBAd+TjJPuKKxB+yo5f
         XESUh1uzGT2vE0hverRb307Z8jGnOyqN5ASjdN2Sf7iulTHMkkPYh2HxZ+c9IIlQd6hr
         gqZJkFac28YmypyPuXz67HFhc5qZGhzGeVWy0Fm31Geegtc46L5YGQRnXQ5w8YyQKuVZ
         UCC/2ErcBfbOXraestJyHutn52csgV8Ea3gyXnyXLG6Cuy3qQj7DMVY1UHknllQrV67v
         379A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774290534; x=1774895334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QLEMWavQsoDtJ1N3rXPKXC/51Eg1S4SzA5jQ67Ss1U=;
        b=hjIC6+8yyfCPontQtfpgpbd8jViDd4dn8r7PLMYGPnH8gGII3RNNPjPP9RDAXsZSdS
         YMhU63IqTaIcgvfipqRx+IhuIa+hPw50JA0dGeinuQ24twkUfq8MlysnUyKHZQ0jZ3xI
         dnWE0nKb/naOQdgr4OUWT73OxIWMMnXlY+GqAAQXMueVHdy5/ffvTW7ckBwq74B2oAcv
         PeoSOVCibZugaLVgDXN+TsYTrOyERXpYpH5RS8OCgpT+1wGTWv6V3zLiJhJMYxIbw9h1
         OVmObHeQkjBVqr0NOf9wjG4ed7FqCj5fG+39ongo+0e8oT4jH7J+hOvzotv/KDtjngAf
         M8cA==
X-Forwarded-Encrypted: i=1; AJvYcCVOKU6VXWMyZqFDJp4mLKTUZF2468lpDErttYaZmWvA4wb+Q4tJ18YtHz8kmVAUyApDh+ZWVsh0l9Ai@vger.kernel.org
X-Gm-Message-State: AOJu0YycsqJEFI6/ijW00GHjF+QSpfP5VNGOxmGrodcEiViAj5xZz7Bh
	HwnlPJBBHwGjfSXA8wfZsibx18ywrqo5xIxSUdVRpHeLIVk2GXlzNy3Vz7S7MhgsCDmrInO5dfy
	y2YyDeTKcBURuYKiGDc8Zc0hOp0o/Ku4VAdyVLznb+bEyZ1+PTAR8cqfc6sNk6ag+ssD6eKfo
X-Gm-Gg: ATEYQzxfN5Qnvn1+mvqwhOS3ufkWtN1TnRL+Cd6CAeB2IyRwX38twGDsGwZg3A2h/8L
	q2uERJU7zbetZSIKzjAtgWZ/vJkGJM3/sX6h8Z261+PGJVxfiTrM2bfbjfWM/o6nBUXVe9Qip0F
	cYqlRx+d4OzUO7w/QcVcuJpjdnYSw76puskmSMg253fMg+jz4UhI6U3O01GIFQigE9Fo/lRlGXV
	dZlbxUcr5n09WXuXakZltRmVterzUQu1K33iNvDBy2e504G0fD/Kid/nwneFP6DeD/1+M2PL55X
	IRgzcX7cama1KfvsWMHtrXZc9NzAWRascPQQXfpdjcoLRKfpXFQQ+Kp+/KGXq7BQJX9cKFC9cw6
	14TIMZwhmftnW1R8JdFEUKjLKHoaN1PZncw==
X-Received: by 2002:a05:622a:49:b0:50b:3014:22a1 with SMTP id d75a77b69052e-50b375bcf77mr216836081cf.67.1774290533480;
        Mon, 23 Mar 2026 11:28:53 -0700 (PDT)
X-Received: by 2002:a05:622a:49:b0:50b:3014:22a1 with SMTP id d75a77b69052e-50b375bcf77mr216835531cf.67.1774290532659;
        Mon, 23 Mar 2026 11:28:52 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c7fsm31181154f8f.23.2026.03.23.11.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 11:28:51 -0700 (PDT)
Date: Mon, 23 Mar 2026 20:28:50 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: eliza: Disable UFS MCQ mode
Message-ID: <ze4k3ynmcjvjlssade2u4e3femyps5iafufhlgnhnbjb6angja@lp6hv5rk5e6t>
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
 <20260322-eliza-base-dt-fixes-v1-3-c633a6064a24@oss.qualcomm.com>
 <7bpvzg5zkytzgorbuxyo77aj6egcyll4qbzxqknearhxmttzl6@bbrcbxlowtvm>
 <2bd1e03a-7da4-412b-8b90-4f449942211f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bd1e03a-7da4-412b-8b90-4f449942211f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fq7RpV4f c=1 sm=1 tr=0 ts=69c18666 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=1n5GDjukrETTFaDQsKwA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: LNsPNaz8ccw0mQS_g0s7I63fLGPX32qR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEzNiBTYWx0ZWRfX0AsUz1JQy7Au
 MLOr+0W4VyfjOaJ5Ub0s7uK+Te1Lz7pAIr6b9+SfKOxQpj03g4JKD3O9ah1Z3l+A3qSSGYDfeyx
 p5NGwoS9KcJ0OXui8Vbizazv09kvF70xf3jQ8JfNtT9u8N8935BBN5d7a30fOGg1JWap17jxNzw
 GnXtHXC8qn9XtuDSePOqj5f2m8CwKGDSX0dsWPQjOoGEdy9YHPFVyWwb0GFeWt6mEO4X7NRThjf
 qsZLTKQJu+m2W4iHS6niYwQy9DrzmVMwOq+eb3C2lnGKcpJ4gnW4GYLiRSaNsnZ23aGEQS/elkz
 LfQJOzrUdTnfDrVflvTON78bwdNDfRjaovmj1+Eh3hNGXS0EhscfTtW8QkyYrvFpguX59KHsaU5
 pXKGkSRNsI053JC2Rh3MMaoPrWHdxJNc+7rshMQOthhtNdsWd4ii0EX7iI4C9tTrvwpq6o+vZes
 vRB8ha0Fh8bq9uiTW8g==
X-Proofpoint-GUID: LNsPNaz8ccw0mQS_g0s7I63fLGPX32qR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230136

On 26-03-23 23:46:04, Nitin Rawat wrote:
> 
> 
> On 3/23/2026 11:33 PM, Abel Vesa wrote:
> > On 26-03-22 18:08:21, Abel Vesa wrote:
> > > The UFS MCQ mode is currently not functional in the driver. Eliza is
> > > the first platform enabling it, which results in UFS failures at runtime
> > > with errors such as:
> > > 
> > >    ufshcd-qcom 1d84000.ufshc: ufshcd_abort: Device abort task at tag 4
> > >    ufs_device_wlun 0:0:0:49488: tag#4 CDB: opcode=0x1b 1b 00 00 00 10 00
> > > 
> > > The failures occur when accessing the UFS device, while the controller
> > > and PHY initialize correctly.
> > > 
> > > Disable MCQ mode by removing the corresponding register range. This can
> > > be reverted once MCQ support is fixed in the driver.
> > 
> > Nitin, care to comment?
> 
> Hi Abel,
> 
> Validated MCQ on SM8750 and SM8650 now with ESI both enabled and disabled,
> and it is working as expected with no errors observed. Mounting, read/write
> operations, and runtime suspend/resume were validated successfully. will
> post the MCQ enablement device tree changes for these targets tomorrow.
> 
> It appears that some changes may be missing on Eliza, which will need to be
> debugged separately.

So, after a quick debugging session with help Nitin, it has been concluded
that the problem is not in the UFS MCQ driver implementation but rather
the GCC clock needs to enable FORCE_MEM_CORE_ON for the
GCC_UFS_PHY_AXI_CLK as well, as per MCQ related documentation.

Will send a patch to fix the GCC driver instead.

So this patch can be dropped.

As a separate issue, Eliza DT UFS node is missing:

msi-parent = <&gic_its 0x60>;

So I'll respin the series with a patch that does this instead.

Thanks Nitin helping with this.
