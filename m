Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8CB3A4F36
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 08:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775723931; cv=none; b=UZFvONa24lwdZAj6dnKd5j9QZSCXeOI3PBPbWklUsVR5D75rMFP1AGNoy4/IUmlzcpr9FwUQe11DBj6Dp8UP9kTOl3xMYykf3id1DieN9VzoeVRPJwDjs8Rb2tgLKoiKWWOoSdzFwrB1msZ9qrNtuRCQTN9zEYD7LgFuJoNs0nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775723931; c=relaxed/simple;
	bh=dyEYiHJn+GTHqglyejYAPDrVqkVAks1wYNWEwgjs6cU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tSiIRj+YBl4ip+SIQIGpO4D9SgO8aUQd1Thx8hS8DyNRknp5Nx4lYdZWPeqa14B/CfVNBneEOvV+szQ3Fyfs1uh/rAEjA+0OQlAdVoqNyWbuOuZVxi3MAh+4Z/miS9nUdtUIUlv/yKudbUUj838Dci/HsFWHsw0NFkqq0e3W0k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CnYozH2b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G1Xk0Eos; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CnYozH2b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G1Xk0Eos"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6397Maa33781421
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 08:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eYwBa7/PrdWkGLaZRdNmRk4LtVyqDp1vHraC9+Qgq3w=; b=CnYozH2b4HT+pQf7
	vDB8RUiEx9gIr6MEUJfOqr0QvZZNAcOPEFitLDaDLAD31Nl6+3ey+xXagusradCb
	miswIkALGtL4Su/cKPX7pnLZSz0DfaNxPyO1YB4Yy4TOd0rDIJ+IBtHUH/6GZU78
	BKXC9MHhzdNZv96c3r44CFjx5BcYGcHhoUFtsXFQ2mOI3DrKf5dNbUF2W01MxOyf
	EJGKYZacdrsAGHq6nDtH4M9rPNXCjtaqBjaPPeiNGST9/AcQio3GE2bnrbaeZvsE
	/lEUPdX0UqDwHXDxrJ1Dkod3CDJDg/Mrlt2VL24b9dmvw/Gj+hMJqOJrDPy2fvpV
	CQP4yQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt6yb6fn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 08:38:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50da529ff48so21852491cf.3
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 01:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775723928; x=1776328728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYwBa7/PrdWkGLaZRdNmRk4LtVyqDp1vHraC9+Qgq3w=;
        b=G1Xk0EosZ0h32t7+GnKx/3yQCoIk386pRqpNIjCOf1ISVjsuCyL8zGn5i9+grTo+/p
         WyLZ5v0UTslqCNHyLYYkP8VY1XEe5KAkpt21w35TQDGuMS5YPT7TNqlVvrr83T259VLC
         EWCOael0tIguJDOoG2CJwVN3ABu57orN7ReMxBfFD4UPskyujP2gd2YGfWLH1iTRFxAq
         xM6+lQ9c4Il+b32T35r72wBeUNeakWovAwve/Zf3zzn5ecInuNy1b27DJc0A27VIRbVY
         5wEuLZOm3dl4g6bcS+nN2lUGItENfE5wnrWaI+4F5lBYcy3HV++IfI3MMCZsD2k/If7M
         61lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775723928; x=1776328728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eYwBa7/PrdWkGLaZRdNmRk4LtVyqDp1vHraC9+Qgq3w=;
        b=ACL9Ec+LY4IzYpakgSMVL1aJQ8lSKPyavbcBmNKBg0dzvv/Y+Pqx2VJW/MpBIJXlbS
         neVVKj1K66NQXKiL2qpuxxn36gGNscIm6PoyVEn7TCIp/+anrkpDTeEuGOXrQBgu1Ew2
         FXpk41nXmgZym1Xp5/r+uAiKxg2WR46iaHQsvFsug5IBUH8MuQYmVnshS0Is3KaRb73F
         SFSu+h03yovlAeila/dcKgyzPbRTPCN1XIWn/I4tRughAVAqhBru4NUZpQD7rjrIYOQ8
         iHlqVa5dQzrj2BzlM0g+sDrnVAHDJqmWxlAN15oRrYx6yLoVmcGlBXD87mcRwDiFi//m
         tI9A==
X-Forwarded-Encrypted: i=1; AJvYcCVXCqpMky+4BsLVH7httepub/fQQWyqx1bbxirgvXzQZCgirt8P5c/TviTqawVCHIVNfdLov7MGDlLJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyCKDpASpWM3UyuFd3Z9Qg2Ohh2VTtIVaOVVf4wECMqAGO/upug
	7WvgiX9d3qeKzwNvfTp9rX4hFIkKYpJj0r+JrfmMOKb4EpAxk5lzqzdR9U5xgqnCX0RhwKIpN9W
	25x8hFJmdspv7sDqTGRC4lxc59+qRvK8/vee4J1kpmLoMUAZ2KMDdZEEVFN3NfC2u
X-Gm-Gg: AeBDiettnQa70eG+QzAj/J+R+Acu10uFLRXuitGwmo6jv1F03rmeJLi6ocD8q2IKJ+x
	dWiXzlpcWOJ4Ns8SyacebmSvsvvfOybffdQM3LR2y5lrNEq2fPOsdAf7AeJTiNe2gn8llaJNXGf
	9XAmoiqelRVJQZy/0N8tQpB02ScB7HfmSZKrxnzOdDyLj7pxwD0C0igDhg0rysKL8uNYG7SKJji
	Sd46/s9XF9YLYhElfOtqQSEAfuZ35vYSh7lbgRBOw19ujfIF45F58DP2eZd/3z2UvLOs98zPKYn
	UckLBD1i9Ayi0uROL5G81tOkJUVa6cYkVheckQEpMMkFwjqrqXkpiMtJrVrqIyx39jZhF4kYUzb
	Ra0m6ASQ8tblR2yTJdC+CcX/WXHQWgfrfej0frplL2a/qHUbrq2A=
X-Received: by 2002:a05:622a:2588:b0:50d:6557:5cb1 with SMTP id d75a77b69052e-50d6557686dmr335304801cf.27.1775723928308;
        Thu, 09 Apr 2026 01:38:48 -0700 (PDT)
X-Received: by 2002:a05:622a:2588:b0:50d:6557:5cb1 with SMTP id d75a77b69052e-50d6557686dmr335304581cf.27.1775723927864;
        Thu, 09 Apr 2026 01:38:47 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:25ad:5d40:fb11:35a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c60a2sm63428947f8f.10.2026.04.09.01.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:38:47 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: robh@kernel.org, Shi Hao <i.shihao.999@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        brgl@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        rric@kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: gpio: cavium,thunder-8890: Remove DT binding
Date: Thu,  9 Apr 2026 10:38:45 +0200
Message-ID: <177572390344.62363.14529394859379173420.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260408093313.17025-1-i.shihao.999@gmail.com>
References: <20260408093313.17025-1-i.shihao.999@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: SUdrB1sz__m_YoU9w5lZfk3ISMnhG7OH
X-Proofpoint-GUID: SUdrB1sz__m_YoU9w5lZfk3ISMnhG7OH
X-Authority-Analysis: v=2.4 cv=R9sz39RX c=1 sm=1 tr=0 ts=69d76599 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6WhlqGIWKwR2Oo7JxYYA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA3NSBTYWx0ZWRfXxmrgDQF3aOtb
 FwJ5/Z8IzsPQzatBpwFZWd4V0R57IzDwAn1T4VHX/fr5Xy3UbpUfVEw5o5ZrODb9FOC3vVgQD7Q
 1EqrmsbLoBymYbeAXOZArhqditggZrf94OlbsS6hvP7O4MG+zxCGxQJ+wS/vdlGlU4fZmTqoQ+k
 wiMT7An8JsgnxSyGmjmJVthPorVROfYxkzgK96huqpq31ohoDosdyNdHniqC5aYTFIkIHHmUnHZ
 zc8OXded/BtPc+ZJTfggf4vZp0H/5oO86YNLtQ/a2CYmMpYEmuZOrybcRrDnQyFtm76lqcz2Bsk
 SaVgLbRECQDJTwYvft8rq1c0g0Gjp+R/UvK76IxkVvzgG2B16qWpZffhNsmNsZP6baNEv4pEYNR
 JB90ViRij/dY4E9W6+heZuzeIoHHDUW4BjXbr12Dq+MfAuhhLCPg1jdvxIAj75IGOfFj3fTIEtB
 8jV47MhrBzAdUEq2zBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090075


On Wed, 08 Apr 2026 15:03:13 +0530, Shi Hao wrote:
> Remove the cavium,thunder-8890 GPIO binding as there are no active
> use cases. A previous attempt was made to convert the binding to DT
> schema, but since the binding is unused, remove it instead.
> 
> 

I tweaked the commit message as suggested by Krzysztof and queued this.

[1/1] dt-bindings: gpio: cavium,thunder-8890: Remove DT binding
      https://git.kernel.org/brgl/c/5bcd451286176202f4ba84b89fd98c7ea74f33a2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
