Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143354ED1AD
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109680; cv=none; b=PkoOciPaim0Y1V+r2RmWWeDXR7VKhbkUkHDZN6AOZIFnbFrz6Ws9WqlwNVZvT3gBDLhloACww2oVmX0waPoz5Lbjf9LM7QX49x3fchjdpXT2FAMWkgsxesJ88SEpsUy/7N1nCaZ4PX1EgRiAtnTim6Z+2Xr+UscEViVNZnx9Xsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109680; c=relaxed/simple;
	bh=Was9xrJcKA0i5gWxWGN8G4b+EGFRxvYGC6c1tInqrrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5kqy89eBXIwSnKCHPlKSo/KoibRZBMszqxUL0EX4Zdxvsf7zeo/cF7SVvprUj44eyCF2T55TOKgsNCMqj+maDcGsdHmMc+YkeDrrUOAPDWeEJEFNxaNx7n35QZTsxYROmgwWPPYAKchiACL4Dy1Yw1q+0xltRzZPPoDc53P4Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JE2AiTm6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f8UbU0rG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JE2AiTm6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f8UbU0rG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI74lA1873608
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kpSBu9jvqWp5KjJaZ47d6NVO
	S4pKiq3srWWOoTSWhdc=; b=JE2AiTm624Nz2B/YsNFX2W7LqpTQpX9Yh/3jJjfZ
	0CrqXl912W5uaWLr29JAO/zJsUKnuF4DQbqWjcWgv3kwUk7Us4iU4pFJdoomeNKO
	zd2LWkzp+i06V0/OumiOHxlYhUYcMYsYWqf9BeNk70yI+U0mEQSBtq9iLK8CzsGF
	jEs87pMVdRmTqRDCWqbAR1esY7Uf7NZQnXi0jZNE6u95J1Jact+xm9LjzP0SQE4t
	XWJ+dZ9hL3ciNsOtHJm+lrqtZpMXTKndWRIAJtmEFRFwGhJwhbMLYEY+N2AVJRaJ
	pGXWmLJ450mccGRVuQtYwf/Llx7bLwV9hBfqixEDxJbSiQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqk4u1cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:40:59 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78fb9f59781so271036137.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 13:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790109659; x=1790714459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kpSBu9jvqWp5KjJaZ47d6NVOS4pKiq3srWWOoTSWhdc=;
        b=f8UbU0rGAfened+Vhx9NFgFGtPe2KJ3E87RmiVCE/l5zN3Skca1vsoN1SmOt7twzn3
         1Nc3truS9Lz3tMu7NcVKat9Uij8TdVb/ShQtOrkk1q82aiZtXeZKmSr3SDCClR2qWVEG
         33SPZCjKQV4DvqvgGebuzmM3hUOAkGeYlrGZ5IRPHcQHsRXIqwMyXnXWUoYGJnPDx1LV
         qw7h/cRsLd3YkIBedzb8W4+Ag4SLZpsMjx6FqQO1Lg8lbXSNBAZMwDSc1afLApYCTGzR
         ij5sNJ0iJLhuWtWWzXrg2QXab1B0yyioohxFXpWuppllbx99sg+c9ROayhoa+KzSIfEZ
         P9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790109659; x=1790714459;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpSBu9jvqWp5KjJaZ47d6NVOS4pKiq3srWWOoTSWhdc=;
        b=i/YBQSztcTw8jQ720LwT/lYb6kC/U+00PD1gydj0blXwPEpFha7U2Ib1Mo1zMITcPB
         WRZEYf+TYY4nwKjFKc4kAq/TbkuQkIO6uTX0e0nwaEyB1m5k7EWnY/oASXrOWE04+1B9
         YsHigjazaNDCNdqWxMXt6KWDNLJ47RfsW4C25cGqcS0eqyQVUJPyL0M4oc/+rvVIseK+
         DXpOqBctzIlCmwOspGmZyZmEc1XsQEgv1j0FdIK3cdR1waFgYrL5Rv8B63k5cYPU7AV2
         B6TybUtO/AZtmjuJQEBUXv13Qn37NxysZghM00yZb8fLwp8CK8DWg77Pz0Tviyu7lkQ/
         e1kA==
X-Forwarded-Encrypted: i=1; AKwUvByuAQ39BL4t5AH7FENNisufYLVzLWk5ZQ6loTWUyoOXjpuErgKdxRHCz39ZNZFLsB2OHExVHitMvXGh@vger.kernel.org
X-Gm-Message-State: AFuF++mThPas+OYAsTfQw0Fw7QapOdr7PHBjee6T7ovEABF4/oq+X7OD
	YKWzvMHy7gXtbyZfP0OP9dlY8qywVLwr1uy/cfI7xMSzCRO6LNr3rF4xzfvY6uR7tjqtCDm7lEZ
	kTO5yNZAFSR6cMPcvsU3uME/uHwKA1pEkjYM0POBLU5h3/k0X/XEQuzjLD5G4qzGy
X-Gm-Gg: AYBFou3n1mwGd6zWRzKl5Nq4/BSavu3zu5zyTwIbmLk5AiQphCF4yKHb+0Tly8OrxTw
	BF1kuaRcsZ8dK4ZBoYMz+R2JC3uu1EM5E6kp8PiamGkL3gLsN47CxtgcHx6ysE9H+DI8OVtmWpx
	Wc17xBn3WagzdOcYZpA4ZjKZV7Ou2RsElY6VO6g/QI55BIOCG6TN1qfA7KVk1zuMOI1Ht9AND2v
	QezCGnlrAQ4mGKV3XjRBP508XYLMaOHDYzhfpd/w1n/8wTZa37LZocwkpr5AJeGG361tg8ViBhJ
	iiAigyFJNER1WRk8utlrn7693yt5fuOG11MytnPUGubwz7cR3CN4FDDS6QM1iXEj8tf+jn0tSr3
	ROPyk96/k1Unx1A==
X-Received: by 2002:a05:6102:6896:b0:7a1:f7d2:e82a with SMTP id ada2fe7eead31-7ac1e65c1c3mr771086137.35.1790109658720;
        Tue, 22 Sep 2026 13:40:58 -0700 (PDT)
X-Received: by 2002:a05:6102:6896:b0:7a1:f7d2:e82a with SMTP id ada2fe7eead31-7ac1e65c1c3mr771060137.35.1790109658190;
        Tue, 22 Sep 2026 13:40:58 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1e045dsm18896285e9.11.2026.09.22.13.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:40:57 -0700 (PDT)
Date: Tue, 22 Sep 2026 23:40:56 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: Add lpass audio clock controller driver
 for Glymur
Message-ID: <acfvnzzcwzqq2pcchzxkrnesdcpqthmucax4elht2xzw6kd767@yqium6n6lb3r>
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260922184425.56114-4-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922184425.56114-4-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NSBTYWx0ZWRfX2n1TTCs3SlB8
 9TvjtWgH9olUQQxDHKT+aqaUgek+8mNVjpkXoKADl1hvWp1XeJ4j3hJm+0mYpsvZelJ6beF6KWu
 BFAwTHibelVl0oFVBerzpu+lRdOT4GaP1Xk04y8djskrrvs3k/m+RUumLCdXr2hKNhyxcczUBQd
 T/e17Ew8Uwb9zlJvJJUjtdnIx7QPnL4iNGhUzxCJ5ipX5koRaaCRscMzXmRXdIcA2txx6K2p/HT
 YzTQGLT4wFzMXXZXucIw91PaMiMfUOmd3gDePbHuhJI0BCbR61cjyhwijn2qXvOsVAhmbuVOOVj
 MvLKm5uuE28e8WFoWOFlTvF5V31voidAVvXishD/3evzBb5fwiBUZfRErA2tlk4rzWZ3c/ylBhv
 VoDOTckpNLh91+5MYqHBQpuKfFiKorCsKOW5MHJy2LSw6dnMTCJuENKbWU0NoYKPBzC4ImMc27u
 YVwGTsBmnvr3HJMBO7Q==
X-Proofpoint-GUID: K9yVghJW7GWH9HgRzelU19lXpJ9kuTmu
X-Proofpoint-ORIG-GUID: K9yVghJW7GWH9HgRzelU19lXpJ9kuTmu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NSBTYWx0ZWRfX1Uea2SoGtMtz
 2AM9uAME58x2ZcwTyaqEMXZJ1sXTTf/cNH4BG+bWV+Vz/Vcq8l6TlOlcM3hlCnP84vYJWjW0veR
 N4obaFaNJtU+ax9KEoF6BlrZVbqsbgU=
X-Authority-Analysis: v=2.4 cv=XrVvqlF9 c=1 sm=1 tr=0 ts=6ab2e7db cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=6XYEiC8ceDmu1LDSX3kA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220295

On 26-09-22 19:44:24, Srinivas Kandagatla wrote:
> Add support for the lpass audio clock controller found on Glymur based
> devices. This would allow lpass peripheral loader drivers to control the
> clocks and bring the subsystems out of reset.
> 
> Currently this patch only supports resets as the Q6DSP is in control of
> LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
> channel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
