Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34BB421A09
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676700; cv=none; b=I0FNWKTEl+CXIpOCVSz5AlFbQnqWVRMqeion/aKSYPXQX5g6DDAyepp2MxowX6xiMUUPpU90FzSMp2RxHbhCgubnlcQXPC2/1fNJhbQlAs3kewfyViBeqSGcBf/AQE4NIMjoY4W7hlcANKgvAdL60R0v130OB7ETVp2VI97MVlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676700; c=relaxed/simple;
	bh=iZ+rhY6naGHKhMzrP8QxXXInCAg359+FOPwWyqsge2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZASp+T0IBleRR0ufkNkjZlyhLTSmEfyRmizTusiv1K0If/Jl/rGW8vgxmEBB1mzJlqWrzQVD/y/dhKE/vw87AnCbhErJUDZkzSkkNoXn4e2K9IjxPs+M/W8eR1NOUK49/UokxlhwopoqeD8PL4KPH3wTG6yrHWQ6lSZVnTdYmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NDIq/Rxu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LhqhFQ5I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NDIq/Rxu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LhqhFQ5I"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8wsae4159821
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Kn/YRSmu1AmAJzx11ds2slyz
	figdFYuhEAsgIp4NDkU=; b=NDIq/RxuVg5XYMINy06ojxe7GwBFB7L7J3aXz/LS
	4emn1bqc/pRI6ToX9L4lwDJwgUt6vbxim4gCk2AIEDlFZQvQ6TUBHY4thmHCxASD
	ym6XNRfqdHyxRo4FQpiUWfyItlAKntC2C4kkTD5k0Z2PM7SNkf2/ByUFma3Jqize
	1Ncb0pYX0q8xmuDu+cDbTouWdcmoVEW8EURr5xqU6+rLI4eWLeHzHsYWuuBidxy+
	wDFS5jsPP+y06x0dJaUVop3oixYvSVLo8VdtwrQw+sEexabiF5pKWJPaF6Wbqif+
	DbsMwbXCB8zFCJY3oJjMR/Q5axe0njkSN42RdqPk1OUHsA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91rtp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:51:38 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ee1da7a13fso8424489eec.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676697; x=1779281497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kn/YRSmu1AmAJzx11ds2slyzfigdFYuhEAsgIp4NDkU=;
        b=LhqhFQ5IIB44hLTpwBNbdhscYptc3t4HxPbXz/76ykTBR4Tw4c6PHKDdezlKRXUAf3
         fGTv9+EaiOPSl2T/q4UcJXhSDmT8c0srS2tKOof2fzExME+n8HNX/35yZKWuElueysnC
         Rk2RkOOOBobxWmaWNtxn0qqztPiRAXCXr650ynAjIncISeEg4zLtafoF7mDJ9rcKenwa
         LC6ELcJEGlrY/XIgyTWsey8VebkC92+RvKmWjehKJTeeA/RugjG77NY73iiUY6IfZQLT
         V0s9rr+/hT/VEr3ptFAGMM8VjmxR8sGOaSQewTUPHBHP2mGg6ZM6CzHAgy2zNimXEWuD
         hIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676697; x=1779281497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kn/YRSmu1AmAJzx11ds2slyzfigdFYuhEAsgIp4NDkU=;
        b=mpMeOEofSFoweqZMML4LxF713SgJx7CWVp8mXNsCAmRp9PQKLzOlhLghYPrpsKhBCN
         Qz0d4nqc8hJgUBe1PQecT3kvpccrqfqXeuLfuJblGDJarX02E8NJZWLdR7A6BoS//v5l
         TYA5+tEMtxCLmivyc5SQNlkUdUUOt7yxrSqdG7b01QtYb/TXn5lhABKzPX8cM56kwRou
         /ilImwcm8hageybReaewTXHHKOuDiNzGMK6aiYycOXm8/JjptCjd6KxGhSO0AwrZh26j
         IxI8Neh7QfQvbQIHHC6F6IPe0VnXODJcdtxgSatBR2BQq+zeefl8Vs5SiTXWRWSPk/K7
         AVlg==
X-Forwarded-Encrypted: i=1; AFNElJ+TNYcrX0vPUXB0rKslTv0Izg10IzwcL9qHWxPEnbZdJG9M8JeMrNJYJyLWJCUnSJCkpxHhthXxvP7a@vger.kernel.org
X-Gm-Message-State: AOJu0YysyfTo6qeYOEqCafb2d9ZHrURX2KGDzKIlcgMg+YWxrpJnVTsC
	a8cCQb+o+xIlU3gkVH5A9CNmv2WLRDLbV8ekize7qZS41FmZs24XSZDFsvc1iSRXlQZ36iUZgxB
	CeGw7UaaPRTmoY/eCFSU871wxMFJEXci/KaPbCAhr8/gZF+ox3djP7BZJo1ZQFclR
X-Gm-Gg: Acq92OHrtmS7ED/x0NA92TQv1mO8f5XXrp4Rkt74/dvmLt3t1ZdW6wVtKaOVUHbxF0k
	HGhNZn9V+5uoxOYF6uN16kvY9ddchzsELwlEegrGqqTZ0L+IevlO5m/sb0g0bZkQtvnZDTDbBMl
	cIk3g0YPn+nxRmeyArEvTcOOZsz4l3YZmDIDHAFOC9AnluHlLYBq6U4RiYQIOB4/AuNg+LaGBHh
	qknoQzLw6lUw4XhvVxMpZcBX69GGxzskefBdqVsCD5F6Gc8s0oC+xMeHGBKekhJl+2/8R79QNCa
	KPqbxqneZjtZmHkE2LAz4bR4oD3jZ4XpbRpkAk1bGmvG3DjVfxlmiRnsLVTwoy1BI2qswgsoOpE
	ClUDLPHLSiY61x56Po1V94RZkZ7BM8gf1vNfl1Pfq/HzPG+N9DIpPIl4MvFlN7mXE
X-Received: by 2002:a05:7300:e7a3:b0:2f2:8857:180a with SMTP id 5a478bee46e88-301541afabamr1201365eec.7.1778676697410;
        Wed, 13 May 2026 05:51:37 -0700 (PDT)
X-Received: by 2002:a05:7300:e7a3:b0:2f2:8857:180a with SMTP id 5a478bee46e88-301541afabamr1201342eec.7.1778676696838;
        Wed, 13 May 2026 05:51:36 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885b87dsm26728284eec.21.2026.05.13.05.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:51:36 -0700 (PDT)
Date: Wed, 13 May 2026 20:51:29 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v5 4/5] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <agRz0VSlRYKiRtxJ@QCOM-aGQu4IUr3Y>
References: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com>
 <20260409-knp-soccp-v5-4-805a492124da@oss.qualcomm.com>
 <adm37MruBfXAjLpZ@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adm37MruBfXAjLpZ@baldur>
X-Proofpoint-ORIG-GUID: bQuRckeTkewSrvGj6zWMazozCuTLjYM1
X-Proofpoint-GUID: bQuRckeTkewSrvGj6zWMazozCuTLjYM1
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a0473da cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=j6KSvuxjzLO5aVo6jmoA:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMyBTYWx0ZWRfX2kPEyi8/8PXX
 BGm7QvlfDrr0mdkCWWmyqMmuBfbKc3KFwC0K3BeM2ks8EtOi5B//V8YLNzKjrbsB2kJaD454igO
 aQfHheSe9KXLDG0mGBmLLmtBHrbq1eTNEBnLg7S+x5HTMK6Dxe2t9UQwrXTsYGM+29qqa/AmoUU
 kSHAUV6QEcSBnPs4IYX041pp4o2/lgb6zer3J8/4pG3Z75TLqexAOpbY6fb0Cf70dHMdXUX6ZS5
 b9oF+FAONHjHBLGIqs+HixqbZ9UX5FDPJiJZhTyDzpfxu5fXv31qnKYbjnzjo69Zd8iFHiJFGQ4
 mtfiy4CLHmsHXG0lBZSbJPwmqB13Csc+kzehsCyAlzIxjB/IhyjPmQctog3GI3/YJ0veF4guS1H
 lvO/87t3wz0RJr33uF6PlRXKaUic0ROHOtxIi7Tgzfvnb0VibqYBdzk37Tf0woqjFPzKXInIPJ6
 T0wDTk7jydF5MIMldIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130133

On Fri, Apr 10, 2026 at 09:59:44PM -0500, Bjorn Andersson wrote:
> On Thu, Apr 09, 2026 at 01:52:27AM -0700, Jingyi Wang wrote:
> > Subsystems can be brought out of reset by entities such as bootloaders.
> > As the irq enablement could be later than subsystem bring up, the state
> > of subsystem should be checked by reading SMP2P bits and performing ping
> > test.
> > 
> 
> I still don't understand.
> 
> Are you saying that devm_request_threaded_irq() will succeed and then
> calling irq_get_irqchip_state() will not work? Or are you saying that
> SMP2P driver isn't reliable and we're loosing the ready or fatal bits?

Hi Bjorn,

After an offline discussion with Jingyi, I understand that we are trying
to provide a stronger check (ping-pong) than SMP2P ready bit to make sure
the subsystem is alive. SMP2P ready bit is a pending state which is not
necessarily reflecting the current subsystem state. There was ever some
corner case seen on production environment (with downstream kernel),
where ready bit is seen but the subsystem is in an abnormal state, where
the subsystem still feeds watchdog but stops responding to any SMP2P
request. A ping-pong test could help detect that.

But since "pong" is not supported by every subsystem, e.g. ADSPs on
Nord, we should do the test only for subsystems that support "pong".

Shawn
