Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C448C41C2FF
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790663277; cv=none; b=lFL1a8aAondvFT4Zo1Ver+Pu7dk29zgM6IpUJ1eWovD4gKM1BsKxlk5jlD78XTHmD0LNNov+4ypAYiI0aX3DTz/QJ7GnXFMKTxRn5/clmmTlBc2Slspav1pjtEgSfECAon7cccNk26740auAwdFUsa+upiGIeRMqd4+I2cjeq/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790663277; c=relaxed/simple;
	bh=mHq5AtvkEH8OOCTTKtooA5QyWIUV6+CR4Scingzbq54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WAXwanYa6nXYH0iV0OhdSVePp6dN94u4kJ320RtS2xiY25THtHjvH0XbvvDEKCp2tHYbl1E/vT2pVHAdAmjQCtexey7buY46ytFewwdp5Qd/3CMuGYXjZ2GLSMnCKiPbq+etVjd97eN54Cjp+RPAi8+P2WZBgKcg9iOL+X6/u0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aiuaXYBu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WhH1PKA0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aiuaXYBu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WhH1PKA0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47OEP3891469
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fkg6HeiiW5RKTN6ZHxqHbSLxB7wGEE3Tjdoly/CGbPY=; b=aiuaXYBuq49qryCB
	Aqu1fpOn45GeH7ZvBLR2g7C6TOHGSWW34mcrWXDJNVsInMVBpq4LlDw3OOdBGAFd
	9O9Mm5HIO4S1PnGAqisYPhJTBNxCaVbfZtRznWG/7yD+DjqWs5/lOF3wNiC6E+pL
	yOEfPot4wbHuNmj6JkrdFUZMpHV16/CMjiFOyeoSpdZfV0QF71YGCuPta3NjjZ4K
	xe4f7u+CRqWvR/1s/J9Gw9VtowY8SKt5863klrd4V+eE6S51xTCpaVLINU0jJnmJ
	oPqtam/c7CuAoSEU1blY6F+tHrUrawfZYnXpYZK1hrQNwNA7sRGMzfGGXtXq7Hxs
	dRHSUQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynfkvh3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:27:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso2533700a12.2
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 23:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790663274; x=1791268074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fkg6HeiiW5RKTN6ZHxqHbSLxB7wGEE3Tjdoly/CGbPY=;
        b=WhH1PKA0MPYsIcJshSK4V91UjP2ov/Up+gBn4br7xV9ukYNRi8CgUDijRO2rYqa0J7
         8p3m/eRMnQNoUKj+Yk9zyAENs+1t0JdVz2yKb6wj08jaPpCohalcxKO+gPmtVPBYt/15
         jIJgx19nVuvvOqGUzgEXEkxs4O6C0dPHYatVxIqBzf3TM+OeG/P7lwSzA8JXsyjhVj4x
         6ZPxqi8O5BvJSWmKQeHbWScpzorDTG3UE/9sqeMnzDb6usgjDm1mYDYNu4WFmpxmNX6+
         sr3UlWFrc6zbyq4ImidTWZngXIbGpKMMKTqCct9SScueCNmTHhYMMuFYjlIR595BU5sP
         mVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790663274; x=1791268074;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fkg6HeiiW5RKTN6ZHxqHbSLxB7wGEE3Tjdoly/CGbPY=;
        b=S0UEbtFKCDnyB18mdozCug7i+w3HJzkYbSn59+Y7W/tA9VqOwEaXxd1hf5K9VHjSOQ
         8Blqwp9ShEbMc1A5brF6WkYFr6mmg5a2Pj3XV+j4cA1fLiCM5hqPg8JdboqKMod3m+nl
         sZj0INg7juqp6K2nKqwGUShBlGkDGp4XDClaI+IsASTDKGnejd++7QQxJka1cL/TIv7K
         RojPezZGE+FpWNqpdPbUhdNwW344kzjtJU+IMbT4MvWNKtX98knFJCxLyvWHla5ljDlI
         kan3r9kETve2w6Ornx/m9rNOGhVB05Q3wg8MdFNMNYIaMuwNsItadkgncuweVcbQrPRb
         +qeg==
X-Forwarded-Encrypted: i=1; AKwUvBzd/NlP7ZMZ2eEFjImQrN30Omxd1JJDBFYwpb29cwqzsLqyi2af54hiSjZ6V74AUcaPgFDFOnpb4uch@vger.kernel.org
X-Gm-Message-State: AFuF++n6/btfZ0tfTnwoiZsrC2nNxRZXSXbLp8VHtbg3GkHuGKfrILVc
	efp4Z2PvFiwfv1exF1R/CAbsWy8Y4SM83AWWiyVPf3XzE4nUM2LOJUaXUe/RfQ/lF5EEnl6caSc
	gFayzhfGaq8H7LAg13KBsB8MEMOZ1pdjIUhC7EL4yfQqCjvW8aiZs5NC4Lp35RwQq
X-Gm-Gg: AYBFou2FD0V9jbjKW4BoL0zpY5U9GUjgg1q6qVvCj6EZ73gbsLLX/pCkLUSXiMYtvTQ
	X8KPlrpCZqjHKEYiqvrJlj1To12J25d0SBDcTMtF2mUZKRqy1MPRyKEdX8lh1LSie4QRysdccCD
	sNGVg3jXQmAFYhC+++Os2U26nkQWRg2Rbe3pN40lNZuDz0qkvUmzoVCJ6UqpqXg96yMnNTl2U3C
	pVG6NT0RGdnN2f3EIB9h/SqIZMipRmhSEb1jMp/wzPCSJEkAXSBKBKPT72bRIqa9Q8MEBIsgRCp
	N+ab5KJdzJlsrk/L7lYQxvwEIXQb42LEY8oww9g750fpeHt4alZ3+RbMNmEyqU0LNDoiOgtoD1+
	5PNlBwAxAMxA1ZdiJbj6tlYJXTw3ur8/Z
X-Received: by 2002:a05:6a20:6a04:b0:3dd:5844:c95e with SMTP id adf61e73a8af0-3de0e772ee0mr13779074637.27.1790663273722;
        Mon, 28 Sep 2026 23:27:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a04:b0:3dd:5844:c95e with SMTP id adf61e73a8af0-3de0e772ee0mr13779051637.27.1790663273253;
        Mon, 28 Sep 2026 23:27:53 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7a3b8d70csm3523812a12.9.2026.09.28.23.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 23:27:52 -0700 (PDT)
Message-ID: <141f72bc-72ad-4e14-ae0c-b221a8e3711b@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 11:57:47 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: nord: add GPI DMA controller
 nodes
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260924-nord-gpi-dts-v3-0-74a85134699f@oss.qualcomm.com>
 <20260924-nord-gpi-dts-v3-1-74a85134699f@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260924-nord-gpi-dts-v3-1-74a85134699f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyNSBTYWx0ZWRfX6zSfWNwlzDLS
 VPjv9wxNvAuQqQ9I7psUv9Rs4ksctaAqvd8W+3xxNxigOXUt7VDeIQYsrCvjLRDwECG5G1BZ5f8
 NzSLbvksknW2r4yBMQiomHmEy9wYBYfXBQKq5vzPb6xEXcDcS6yb5kbE+hZThEN/Wzu1ouXsD7r
 vBEoJNWSbMvxWj0OFQVh1xCgIksJMjfgNqtM3+MHYVfKSy94kZQQFlH40p6mkspK0wlKvYWtOos
 ctNyxcFsH/xuOqCvmqMN8ma4OWOSN8UFcdKBu4/1cN0ZogUifH7MzmAv+XsTB2HU8kpkgJHp6rG
 JMR5QbS0Y1QIrq5R+TVU9Z6gVSFDAY0lX/fkEWPjDVHu0VOLMWL0gs4Dh1NrpeVTrz3y4qhN3c3
 vCKDsNcEzLcNrshYw0ctVizPdd1Vi/AH3edR7UV+1fHnZ09pXMdi/MRzNVW4ugRqKMDVgsAJjYu
 i+QYEKZI2oax9v5scAQ==
X-Authority-Analysis: v=2.4 cv=e6aT2qp/ c=1 sm=1 tr=0 ts=6abb5a6a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=svJ9ipqeD9EGsNKrb54A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: qAlNULC0yEExq4ZpWiWzA-9QGP839tPU
X-Proofpoint-ORIG-GUID: qAlNULC0yEExq4ZpWiWzA-9QGP839tPU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyNSBTYWx0ZWRfX32HG0UAJAk3o
 V3uGOSviI8ppee4dXTDV0vKBnqWWVAUeY5XuzmGqyoKNbJdDTOPwhM6IwPPwt81sdrZqhEi9aO2
 exkfAren9iyqcjS6Xa67ykk0WKoIyxQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290025



On 9/24/2026 5:40 PM, Bartosz Golaszewski wrote:
> Add GPI DMA controller nodes for all three QUPv3 engines.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
