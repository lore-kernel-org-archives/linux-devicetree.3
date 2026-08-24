Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3AD2F6565
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558500; cv=none; b=LQ6lpzIittuHzgn7R2Yuaaa+nEeecwq1eTZlrN2a4ZwPBAEXHyHRUZgyu6K2NBbgPVo7M2JCfA+rbAW7kHlPMKWh8j2rkdoBoIn7+seRl5lS4OWMPQIZvJtuOI/1aGeXfO9Ph8xdAIIWNeMZ8t/AbhLE+Ecz0AAVLhdE/MkPYRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558500; c=relaxed/simple;
	bh=vP7KFRuxv5/PvNudwnrv8A7AdwTbutFf3LNghXEf8Es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YGOa2aMlkHu4OseTmDr6B6ShBxuKPRJwCMZavkgGg3sY5Ar5YXalTgQOWca0uhd0IUsXueq5tbavZgPe3+rVN9bgSRM0Pa9dr5XUwKuvQt4j2KuhwmQtX4/yabimjF1pMuseq3xlOVxlISsR7WV7aiFgMyqlyanAhDAk6YZaKQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eQWswynp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JNcHvlr+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eQWswynp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JNcHvlr+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RAdC1477780
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ukMn0O890BjOQtEZhd0gOFgJ
	Vu4vFO2RS+3Y7jP/DNA=; b=eQWswynp7awzOnk+lg3cTUgKBINakVAZYttmSMUt
	v5m7b4ljZwERwWvwgY/xuaqkz3W1YmGlUAFfajCkZYqeYBKVHVa/e5ABoFN5SMoN
	yxS3WpI4viKvcGwqP8WB4HKOhYKAxGprYK6I5lmt/OSwgCQFaj2w+rF4YzW8Lu58
	hncuzdWkMrMbK2S7DXluKW/B/HTa4LkR6VPEfAGqUoxl4sVmFq+kvtjG5h2mD0ms
	l56HNY3vHVMkiqZmEcmTkf4dKs0JTx61zgY9aEiqhW0RIjZt44Ja5tKxdu/H1trS
	b5c/9Y1vDZowrMdQkHwu2iXgPUn8utBZHy29DpYp7+bdZA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g7528nv87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:01:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c083f1818so34252221cf.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 01:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787558497; x=1788163297; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ukMn0O890BjOQtEZhd0gOFgJVu4vFO2RS+3Y7jP/DNA=;
        b=JNcHvlr+OidnTVBZk2211x/yQ8XXRvWs1CClMbAvVVJGfkrZhMWPhNkBx+hETr3e83
         qYfMLwds5weQN67J9XuPbHYPBGSW3mUL02DRWfMe8pJdTG4Y39VAnsNfR9dVjurg0Kdd
         izLPxM6oI9WmjvdLezNBv7gP6ihV1Gs7TeMkXh/XNMZ+w4ItBHf4Q9oT6+JPnGS0UndG
         lHzwD3JuKgZhDGYMHDHKpx5EE+2vxmUc/k4byJMUAnfDvuMIY89Is5yIezWQwu/8a5AS
         KVVrzynXNS26YCf3s/WEGfdUufpIg72PJVzO0fo5BPrHXWcQ2aQJzQy3zuFdAzQgyRph
         5bKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787558497; x=1788163297;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ukMn0O890BjOQtEZhd0gOFgJVu4vFO2RS+3Y7jP/DNA=;
        b=knbW/e0RMMn38lTjyCRUvPenGAMSzEewtPa2wZnQ6wJn7M+7uyHGCYF75qZriXcteX
         7gNYAvaVlojfc5xond+Nwve2N/UZb1vaGt5L1+s2/v9rZij4KzCpygfFqylTI0FYhKph
         Cw7rn0yH7Mlk2iJA0fyLjRD0DOecTSSMPOfA02Qfpw46zXaGnkUO4ejhIgJ3gOh7wZqa
         o0/7mk2sgAXotGahRfoPsDS61iutxAlo1jP5x3RW478P7dqXLItwlsE5K68UTdYkwawZ
         oFdhyU3UzLdRdsINjE+WY6B38lKMP+Y4BR0JGf6LY6cAdV3dfLUoESFG/yedeISbRQX2
         rcZA==
X-Forwarded-Encrypted: i=1; AHgh+RoVVFuOm2hvxOBxYSYYrkbZ9NvXKku32szu9OvT66ws48QrFYTrCwZUYy6E6Of2/elmab+EjMdGz3LG@vger.kernel.org
X-Gm-Message-State: AFuF++nQa68tL5FgRotarQxKfwdHvWXkoM8BZkzsgwJlYTD/boY84vsZ
	3L4sNmnV+ZaNs7PyQMz7PYd6qGFYeR9cO7VFHwC3tOt+Dxqg/d/MzqHx9YwYYX4tpJyzNWx2XfQ
	vmIA8cWFL/GpbJ6BvntRWQprxM8GPPQhIvNYi27+wRVev4QEJ7ue7J0LXMSjaWD0tiPl5cgqE
X-Gm-Gg: AR+sD11GxCCKlF+9l3Z5P5SGgaVyEdEPkhgQlzhUgv1OEeszw/8opjMpYrISQ0sHQUB
	8BTL3xWkUHGTOFeFe1ABEchJLqA3qGyrrbjp8CpdmwINqSMCVlWxMOl/wGjfZDFRq/9LWDm6PBP
	F6DMwGL3R+YkNceYYdonRHK8UZvzXz1+bwhzt2yOw3eH2K7nnMtAtF2/MKmunp/No0Pm7b86QiV
	Eplu3gu7uyTOcZiOOaXUVu5ccCJfv6JCSeF9z1uIjRpCnmSnloqiDlRDNmyiHwzNO8xcz5OKUjO
	NAQMuL5BPMpZnQHyn0wQRmnFdjOrQB86O55o45El6XYySIXl7WR8i5H/kJNmNqLUVN6aS2xS/aK
	VE914IBa33RyXq0s=
X-Received: by 2002:a05:622a:4c0c:b0:51a:8c79:a2d with SMTP id d75a77b69052e-52df56e5052mr252526991cf.1.1787558497456;
        Mon, 24 Aug 2026 01:01:37 -0700 (PDT)
X-Received: by 2002:a05:622a:4c0c:b0:51a:8c79:a2d with SMTP id d75a77b69052e-52df56e5052mr252526211cf.1.1787558496975;
        Mon, 24 Aug 2026 01:01:36 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24962bd8fasm1736480866b.28.2026.08.24.01.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 01:01:35 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:01:32 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v12 2/6] ufs: host: Add ICE clock scaling during UFS
 clock changes
Message-ID: <v7mmy3emjbeorjy7zfrbgqmozu37whvisidk5uba4o5jeqq5t2@ntjncu6bywtx>
References: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
 <20260824-enable-ice-clock-scaling-v12-2-09271f583dc6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824-enable-ice-clock-scaling-v12-2-09271f583dc6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DsJmPm/+ c=1 sm=1 tr=0 ts=6a8bfa62 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yPCof4ZbAAAA:8 a=8RJfRLJrmUUAMqN4eEsA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: dBB5zb0cbuN5dxAywfjpz-B2RMl2E7qv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3MCBTYWx0ZWRfX3/KTzowinlWC
 BOMXXK8TtVN0vsWu9ptRHsGt2LH7xpBghtU/+L8AoxYWy034LScIdsnTsZhOH9q9eQCnCEPOHUV
 NCafL23HOFcarHBPfb11vDxaQM+o9tI/JNLxpufY2C42V9Gl0jqO/C6LvV2qswnhDrxSEP3oP3s
 HfsADdfwLLNmobnJvI4tRYBf1SfovjETB+F3vzvuo6ngl4O9TlGWoVPvzySiVNUukbtz57fZBDR
 XUKomHa+mGPGkC8Pqqaa9XH6Q6shwwMWuLVqEuOaHdvokJU+hbBPhkBrNuj0F3ZK2p0m0pveM30
 XnaVMzSnkg/7oYMvmm3+OVmeZtDiE0wgR9wgPuDX/7iXm8RTP3V6xhI7uO2dgBz7HyNa8d6A7+3
 xDPx/JYpZAut/Gz27Cv/AgCqmmT0j/2Yv1IXI6HMN/koAKnzav6G0B78X1Olr9fq4YxlDSv/wPz
 k6b7eOFZ40xnW3UHVmw==
X-Proofpoint-ORIG-GUID: dBB5zb0cbuN5dxAywfjpz-B2RMl2E7qv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3MCBTYWx0ZWRfXx5W9NbyI9D/X
 jUFy4Ut6w8lOMaB07lhVKAwpEPWLbuk/obFaqTJoU0o326+94kZ2smUIJ6Y0aorRa6CjObbXopB
 ofmrTrWAwPoSn5M5B7tfnXBKd1s5sPk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240070

On 26-08-24 01:17:39, Abhinaba Rakshit wrote:
> Implement ICE (Inline Crypto Engine) clock scaling in sync with
> UFS controller clock scaling. This ensures that the ICE operates at
> an appropriate frequency when the UFS clocks are scaled up or down,
> improving performance and maintaining stability for crypto operations.
> 
> For scale_up operation ensure to pass ~round_ceil (round_floor)
> and vice-versa for scale_down operations.
> 
> In case of OPP scaling is not supported by ICE, ensure to not prevent
> devfreq for UFS, as ICE OPP-table is optional.
> 
> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
> Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> Acked-by: Martin K. Petersen <martin.petersen@oracle.com>
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
