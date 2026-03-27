Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D137639B943
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 19:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774640910; cv=none; b=MMv6bQeRkaX2N1gtgDjaPZ6hD6zUYuqd82gYL3YkIWDEvugkY3OUoh95WSrhDsNlFY6IR9ZmcGK/v7uSTgl+ZZKkmIsmjgqtlr2DXGL3EyTAY5/x/m6OHdE/nX3BlNTAZwPxXbkr3oF82flRJZStrDbhHFq07G4FS4IOMdHoBss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774640910; c=relaxed/simple;
	bh=kf2O+zFRh1VHxC9vCLYFtfaKn3l0/H5+4nndn0X6Vng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rMXP7UVwMZOLcUKCThwk6Zv88lWlb01vynF+r4u2RHIweRoeApdV8+qlkZUxwUsSsG6i/RWZE+cMShwpk8t9UNN5fZwy0bggSswVJIG7XPWio9nHqJgCVvVPBWL/b9ntzJ38cGtel/a2oa3R0unGHFLCHn9yww3VLy2+hb2k8Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fsjdMBjU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Su6BcGJL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fsjdMBjU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Su6BcGJL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2OBW890143
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 19:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xaf+EJhyxzQmyb4o/ktKUdNiEpWBngVq9vn4kthy+m4=; b=fsjdMBjUwm+cIPeg
	5Vi57L/Robb/Ahme4zcuz2/zE1UND5C88kdewbHjNbPYevUK65K0vefDAaEIkfpD
	HlhfRUEqtsRk89+5sf4Q0WjF34nw5E4sv/yzwEc/HkWWr+GsgArD5YzzzluuCC1F
	1uyeNqIaztgK8jMrcS9y3/gceBBlREa6sJn2bWOrMDDMhv1SjfTXAY2eFiYxwxUU
	cDAgeLCxoBzmk/kGCAWOg7cvw4QGG0/Slgu8UJsXEkdlWn2+s35mPqp7uXAAycaS
	1IRsp2wPHmdRlErqIwPLbHuE0Y/vgRV1zBip7y1CWYqM/fQC6LHT2M7F4wPx/OUt
	m8pdhA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5vf6ruhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 19:48:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso115636751cf.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774640907; x=1775245707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xaf+EJhyxzQmyb4o/ktKUdNiEpWBngVq9vn4kthy+m4=;
        b=Su6BcGJLowSZrXbHa9raP2riw9C5eoxuGUGyOjh9oPjukgBQxBX76LoqPCxZPe9sTw
         r9+cM6RmIKlbdqWWzHeXe5aOsKrwF+J5MgRHupHIBhjRPtkeuttAtZ8DS7cwGZgZBqlq
         7arxLQA7Cf18iqemaqHqoaAj30+SzgWBZaUATgM0EIvgbm4kDECLH/kpcfFCXHmskubi
         GeOglc43AkSgG21b662r3UhrED6qa0tPRIMRl8f7nMigPyLlRtL5q1Xnw+MpCqYjozp8
         nhXv9ntRU0TRloqijVW/bVfMN/IDndGLQt+Z/+ZtuRlLCn9dDMaNzM0pjt+t07VgFz3t
         Gxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774640907; x=1775245707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xaf+EJhyxzQmyb4o/ktKUdNiEpWBngVq9vn4kthy+m4=;
        b=rXSb7DuIvFWYqhtZ08bEmGEOQqXKs603148JVTEIruDzBdNfxZnztSH+0mmyr9PP4g
         YstDDBLYLzZ9KATFTuQK95UnSstOGVwku2Iq9D4XJPCRMgqvNu7b1fFH1Ywkw5Yyzb2d
         Vl5N/qNFSxGAVBnq2db1QdEYumSH2NYDaFMuSfbMPRyyhHOSWo8mDjNinj4s5uT7Z6xP
         Jp0PtJMS4KSytr21ZDFgIzb0rfnROuPjDGH3j7Hf/i2bPxwiW3S5Jq7deW0C7h1RjM2P
         eA3jkqP9zcF6gM57HNk7ZTBSG5PC8sKa7yTpOrT4Mk0XXC1jPBVKAUYmz8MCTfiFZO50
         Fuuw==
X-Forwarded-Encrypted: i=1; AJvYcCWJ+p4nAf39z+t63MbfAzq32Jprn0XkC4jcQwRbH1MD7GNhtcEzkX6Iv1QTYbMp/2tSiEM+3aow3MZK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9nYnTI55vGkCLbONkLQxmXwb4AgEYLsJgHl4MKHKJqZCjhSkJ
	ULxra76vewEt1GkAuOyIytcP14vOhUS6Vv7OHwWzSu/EkjaZScxByySjZ1h/+Di3L01D03Zi+WS
	/FUv/DRBdqUfYKjMbEwO57gIvjlkIl/CKegkbo8k1uw0iR1xrz0BdHAmo2jOGnnkP
X-Gm-Gg: ATEYQzw79chXZwjItVhHNnc9lP5BQhau1dtomMsuDIqKQAFsQHOkE9ZnoX5CR/UfbCH
	1vk1lng1+cM87A9aGxeLAJVQ4PZfZTxx5qJK54cgWmyMmziKk2J9t/2+ZCtsy2/t6VTx9KdhVXW
	cvUCJ8qoOw1TtiyZ24i0NK7cBh39Q6+LJ/u5OxYGqgL4w+2vn4NlL4LMAKTooZTK/dEhIXAZ0g2
	CG45d+Exl7n7kgjoS4kCphCNajKJ8P20Yxi+2nPyrhXa9vc+9x2waf4OtnZUTK90h44h8jtDfMI
	pfniATTdfSrSyOvNklMUhtCcvgaIIQj2IJJR0xgjFKf7OFK5GGVbATM4635tQZnypB6UjuuLv0L
	xnTKG3Tapjcu+xm4mXO2qR5nuI1xCJUD63QViK3hPHoX9HeTKS2Llb2kTWEXKOnMGheEP+nnLJS
	5qxR/qMp+HTObdAOtc77KzyxTPnDoZO7te
X-Received: by 2002:ac8:5992:0:b0:50b:46ee:5aed with SMTP id d75a77b69052e-50b993c6a6fmr84329251cf.10.1774640907082;
        Fri, 27 Mar 2026 12:48:27 -0700 (PDT)
X-Received: by 2002:ac8:5992:0:b0:50b:46ee:5aed with SMTP id d75a77b69052e-50b993c6a6fmr84328671cf.10.1774640906583;
        Fri, 27 Mar 2026 12:48:26 -0700 (PDT)
Received: from umbar.. (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c837130basm275211fa.12.2026.03.27.12.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:48:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>, Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tianyu Gao <gty0622@gmail.com>,
        White Lewis <liu224806@gmail.com>
Subject: Re: [PATCH v4 0/4] Add DSI display support for SC8280XP
Date: Fri, 27 Mar 2026 21:47:54 +0200
Message-ID: <177463970833.3488980.46426040533799484.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260308064835.479356-1-mitltlatltl@gmail.com>
References: <20260308064835.479356-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X/Zf6WTe c=1 sm=1 tr=0 ts=69c6df0b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=e5mUnYsNAAAA:8
 a=qwUskhSXptgb2aVpTsgA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: ahVQwAo-aopcG0Fqf_IdLYeDtZfj2fVn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEzOCBTYWx0ZWRfX25aJviPI9/LA
 1gXUjQsS1dEG84EkdiY9houb1fuOhk6Z/69cC+L4CAEo6szMUfviXYQ6rySVApeAn+6hgjTU3Gn
 CzF31h8+S2RpoTgb+J6ZubXRuhE+UR/pu3pqpZqi2p63p7XSdjOukQ81QLACsT0Wq4D+7a1cx7M
 3rM25p5XmLQ1hR5EHBnUHpllZxHGzzzKF6gryiNnrCUiC6QFAIryFpDGptHB0OwM3++Oq41MPnn
 SqToDG/7ODpvE+O2lvivcBvl4CS3tg6GU0G+ViR6nfosEecuvu3FQMOFapZ6zz9Fs6HKsR2oFeJ
 rauIb7iIFJTqqYyr2cnIxkFnfOElWCM6ccBgDEJsB7kobmYDDx43ZXKoyUGuslyewFM2oUciXX0
 X42s2uWWR13oDD+1g9PtBpUqBwWZLognDW2L4A7CCbcmSB2nXKcAn2WlEg3+bGWKLqU92LnU4I5
 g/m2RRz4wv9aIfIgjSA==
X-Proofpoint-GUID: ahVQwAo-aopcG0Fqf_IdLYeDtZfj2fVn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270138

On Sun, 08 Mar 2026 14:48:31 +0800, Pengyu Luo wrote:
> Add DSI display support for SC8280XP.

Applied to msm-next, thanks!

[1/4] dt-bindings: display: msm-dsi-phy-7nm: Add SC8280XP
      https://gitlab.freedesktop.org/lumag/msm/-/commit/59f6bdf913dd
[2/4] dt-bindings: display/msm: dsi-controller-main: Add SC8280XP
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1607c084b18f
[3/4] dt-bindings: display: msm: Document DSI controller and DSI PHY on SC8280XP
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6113aaf7a5ce

Best regards,
-- 
With best wishes
Dmitry


