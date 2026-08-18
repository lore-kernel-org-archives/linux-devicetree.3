Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF338367F31
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 22:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787092922; cv=none; b=H1xiZN4dt4iSUXuX8ssE1h0vLLBecvfOWanUSGQV/nYIWMHSwTEJ7GxR3YdPKRSGhwuFwY7vvx3SUXJ9jDG1d0zxHfjvCZnFsgN4BVXza2WY5XLiIdQ4M4s0QxKQu4dP8ldGLCfgwSCVGUuwNhkVBt6YDYgu0PZE3cSm7f2X5WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787092922; c=relaxed/simple;
	bh=NTUPCBP65ZWZouPN9n+ceWmfignTvfSu1xDUbhAbOao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AWQtN0ZIeOM2ZxlEkOwmDGTcJ7wXNJYQGMau4jGu7iYwntCt5973zQVrRZ1C3hgf6uQ6ofuXqCyFs2Q7algxHlwWTNWwoKbXSmSRU6txYjDCs3FJ7nPnoTbUfMMpwtQk/YGx2Sq2G3wAxLMPdVxU2Kf0L1i1kXRplT5H1g1kk8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WYl5F9s1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E2gQZPed; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WYl5F9s1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E2gQZPed"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ILbNYX2524821
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 22:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/yRlrnObyZVQZ6C9IVOv5MrA
	73SMWTeXgv9J+GAmLS4=; b=WYl5F9s1Iumfd4gRKetAhFo+BZBWrMBEvt6pkNPj
	lW2eGkLQ7lRDLw+DgoXIfThARjvKfFO/PGl+O1j2tfG71UyeRmC8ZdW8T39adBPF
	8rJ38J1yJOhIph7Xy9DX0glhlOyQWPnSWw+s0uprZQ+8oIH8o3HTI73mwilaUN8/
	vhSaFBl7TYnUNPS4R72euofbzGQKvtTYBTgqgeEwjacI/HSMBUflpB9T6A3WFDNE
	IrcXgKEsTs+fWQ4Cdcq6awL1wlQKnjmBf93iXOLfGYdLomD8WO+2POk6uXnWT7eW
	+sxrP5NIHe0uJSsxRZ4ued7KycnJdde/+N/JIZBy9z5xNg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfk886p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 22:41:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ec3146553so75568385a.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 15:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787092919; x=1787697719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/yRlrnObyZVQZ6C9IVOv5MrA73SMWTeXgv9J+GAmLS4=;
        b=E2gQZPedybRWzUDXnIzWZjxFYQ7b7YDabzDQ4z3N2AkntdFO4xfX51ujVHUUdReSoz
         Z3AMUY4Hz4ZucGrNUOag9/0yHekxfLuFPBwFzb1xJ2urGa1DmiLURSPFD4F6ORuW6KpG
         QkyP2Uja04bvFiamE5PgASRhtM5XlN35DxVxU73L9DyVqY4s51T16QWJEYjseX94BYQK
         Gyx8y0OrT8Bp4lH+FfDJBLjoGuapqljSkvB1E85Ai9Xvfrc32MjVfspd4cR0j6vYwnDq
         8UAMSmbC2HFec+RdYh/LEx+2ffmGfvAww7zIIBD7VfEhbzguEwBwW4lIBK3d+By1f1r5
         iKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787092919; x=1787697719;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/yRlrnObyZVQZ6C9IVOv5MrA73SMWTeXgv9J+GAmLS4=;
        b=bxvhZshY/aeLw3pTi34N5FsbqbtpdOXlDBVIrC9QM+uWX+0Zokkk8aVNyDJFPJ4MJy
         d7iiBXgZXXmbc3lUix2MdsRIEgJUqjFdnbYC7gzNaBZ9Kueyq6yFL7IMTDy+QJnR+2BJ
         XUgGTOeDU6xVERnW0SL2Zoll7tGctoyl36a/fNMhZrBY8uRrtfewEFEp9I5ZqHqxQ6fm
         ZcAwY+ucrKlC87Y0ZzaToIAKGOSjQWfJa24VkOlkQVdc3l+s6Ao8rEV5MwBRsA5TBA1b
         qlJfpRWcOFlLse5JeC/ReQ75Lu1NCb6qYxlRHIFVK/yT0MLpUB3FcdJPm6VNJ7UEeQgv
         vSpA==
X-Forwarded-Encrypted: i=1; AHgh+RqJ5ckvoG/XP6E9EVzj73G0XSFsOQnN1Ti9bUeSoqlOuNdluc7lqOm8TIwt3nqzoVi7NSBJkvsgKgag@vger.kernel.org
X-Gm-Message-State: AOJu0YwpOJgmX8YujdXvJ31ltjERGnCr0F1pfZFM28c+NZShqwmcfyd+
	Dpv2GDQnHBaM9p7cCOUnCEb5fKi5r+G7Yvsr+cbyaH0VnEFZIxoKIQ7SBdnH2++bVtOF1Jyq/y1
	N57+NFuiipnBqZ2D+ypbQq0QWR6tA7sHCSvt1c48CTCbeE2xmNGrNlFkfTgf4mnVs
X-Gm-Gg: AR+sD11YNacMRa0DPqY3fEIPKeCXT3xAiHp3GSqE9HEYm9BFpbdLz5OyUJKFG+6LH1m
	APWemLOy7oU7gSesIx4mKzr+HQbuxjVqevLWt99UZhaXcYF4Yt1f2Sdxe4RRW3eiIyiekVmL4lv
	JXoGzmdOppy9sIXlbchJSKrZeBoZsRGMN1yhT3Nrpl2arYvIt962Kbu2dake+aM7YRyPPM5JLdb
	lY0uz6afJUBWTP7rNKzD9EH2BpB/pRwFPmENVtzHpPNig1u2D0jIaCZ5onlfyjU8STGUws/Fysq
	t1v3FXMq/f3tiJ+SQnWW44hohfeOtHV1Jqo4Zer0tqcQNd40Ezlx7LXrEGjop9+WWdOxwuj1GTg
	BlLIFCo4XB9PI7LkHN2NrBx/tyA+VKxqr/HncAzlvoSzL40y88reIrKIqpLjS1nv/la2iXzDny2
	01jXC5C2OdD+0V
X-Received: by 2002:a05:620a:4107:b0:92e:9d63:a6f6 with SMTP id af79cd13be357-9371e23b73bmr72753585a.17.1787092919072;
        Tue, 18 Aug 2026 15:41:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4107:b0:92e:9d63:a6f6 with SMTP id af79cd13be357-9371e23b73bmr72751885a.17.1787092918639;
        Tue, 18 Aug 2026 15:41:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4788d9288sm30212e87.38.2026.08.18.15.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 15:41:56 -0700 (PDT)
Date: Wed, 19 Aug 2026 01:41:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/5] media: iris: Add dma sync calls for input and
 output buffers
Message-ID: <235vlp2bxpqpvgtcqlj3gyh2akclnit4p5lo2boagn4xsgzfeo@qnehnkaye2ru>
References: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
 <20260818-iris-fixes-dma-pseq-fint-v2-1-8dc8c4b3880e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818-iris-fixes-dma-pseq-fint-v2-1-8dc8c4b3880e@oss.qualcomm.com>
X-Proofpoint-GUID: 47ujSi-8XeaOQ5gE0U4ZBr9SQzEjRSa2
X-Proofpoint-ORIG-GUID: 47ujSi-8XeaOQ5gE0U4ZBr9SQzEjRSa2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDE2NyBTYWx0ZWRfX1D+v1p+rD9EJ
 JIdiC1+MpJxQSgp7XJ3qDZGLcs5MXaIt0LU1ovvKO4iSaXygZLRLFnY2RvVHU2jNS1t0czE45KO
 6nyRJL92GN6HWlgIcIpioEDTKvdeOqujsHIb7ZUCluoV00ifxcrCccwoeaglt+FGTcjm5dq2TLN
 3Lde263jnCgEDXjNHHdTN0hCuNmxrwZsAzeKiPJbIDlGJ14S8OzTzDULJzjFYDXOOtWXfHjIFX3
 hZwmfkHtzNVBgux+Md5WWmd+aTVHgUpgVnPLVoolAW5WbkdHYB264lavFKEqKzNK9DnVSLEFWNz
 ciEXZWvfosAe5bi/5NTuzW5lRFbIcnn7o3TB92VZbhPFdoaJEPcSW0Fj0doO7Eg5M8rY1fCuwsg
 XbWpn5mZnCez5/T/VWJdz+9SNz954H3eD7n0IIxD6IaxfSY9WAMgIbDrFkeHiA+g2dzosKOHMtA
 1xqbimNQEctjOZT2zoA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDE2NyBTYWx0ZWRfX0mWPeGxeQFWD
 0itDZkRjgt9eVJnVSA9482Pi24CQ5cpsyVtpmLeTIbwFPKs5OtPhy2yi3ezWdBibrPMsYW3eYaV
 7c/k745IUB2tPjqvmgc11TfJ9Ue2bSo=
X-Authority-Analysis: v=2.4 cv=fvfsol4f c=1 sm=1 tr=0 ts=6a84dfb7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=bEbGTSNP0X9rcrhJXtEA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_04,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180167

On Tue, Aug 18, 2026 at 09:24:14PM +0530, Vishnu Reddy wrote:
> While testing with some higher resolution clips, the venus hardware
> triggers a fault due to wrong input data being received. Corruption
> was also observed in the captured output when the client dumped it
> to a file.
> 
> On debugging, found that DMA buffers shared between the CPU and the
> venus video hardware/controller are not in sync. CPU writes to an input
> buffer can remain in CPU cache without being visible to the video
> hardware when it reads the same buffer, so the hardware receives input
> data that does not match what the CPU wrote. Likewise, on the capture
> path, data written by the video hardware to the output buffer may not
> be visible to the CPU, so the client reads stale or partial data,
> resulting in corruption.
> 
> Add dma sync API calls to synchronize the data between the CPU cache
> and the venus hardware/controller.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Missing Fixes tag

-- 
With best wishes
Dmitry
