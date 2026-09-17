Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCE6497398
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658175; cv=none; b=dlhsMZavHcptKT3tDTxyHUSLEx8/uDbzkUKG2Tw0KHjnpw4S7BzISX4OLvs1HSjPPq9fbxYn588ThxeSerFB8JXx1ISxBsTVkHuJAKYtPA7Q2c/JaenNcVnpgVXVGxTVhY/8kmH6EEoKtp2LJ1dJSI8Hik6IpZvztmzdXap6A9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658175; c=relaxed/simple;
	bh=lrvkzk4ljiq6+vQAa6UbqIX0W8hWaThfBZW4ANi6ELw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HHGZLx5KJQx7i67jvG2YLtOi0ASF2bB33cb+uO3yzIpVPdLkDNElMJV+Zg+jlUKyUTHGDVXSNBMuzTIKLPUBTgeyr7RxTgvO7ETGRbJBFONa19wVJAjY8uG/C7qnLWhUMAMVhh05PcFy1L+MCPyLpIaNerU1GX7ejvxjhFhjkx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GzC2/7Bj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DsnbXPHX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GzC2/7Bj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DsnbXPHX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDjd7Z1307356
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tvI67hzw9WhPRXd+QjB4vXvb
	G5CPBUup1u653u70yoM=; b=GzC2/7BjkMlj/U+Awl/JTson5NlBOsyyZjnrhsQL
	xdkRSixPLGnvOw6XAcBg/qKpIQCSys6rmDaY3ZSJmA/KzllzpD89LdI76cDgftVn
	Nac7tGyUKw/3t813ghO6THmxue2jm0FuW1wcDlmGcP/AwAlhfULzH29wsv/h+peG
	Y3QQZXtRT0BHlfSRPE1rtvDfCFqfrWo0RWSDYafB/FZ3SDi+sD6MNQPTY3Qqa1D2
	7E3EnJuq0vGQnv0twG3DJ7O2NNR4xD0d1hpWClchHz9dxPIo/YpRrB7gmrlFJfAZ
	wwzPb1oW3Bzxu8Ya2uc55OZ5IK9QW5LGdJTNU/Btc1P5oA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grcra9u4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:16:00 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90c8da50f8dso27210976d6.2
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658160; x=1790262960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tvI67hzw9WhPRXd+QjB4vXvbG5CPBUup1u653u70yoM=;
        b=DsnbXPHXLtCglMOXbLuJuf0xWX+iMLqWL4fOMqxNxCbxa8IT5hb/w7WfslMvay+DD1
         rxzZuYEDDoamOXqtFpTUXxq6ADxoRbIwGrPC+kHQFgk8lFO9S1ZZCkc0OQM0aTz3ZMfn
         tY2c+p5oE29jL1FZ5t3TVTthRaKVq/6k04KpKG2yMxEJ+luxWXBKGp/9rX/HZ1Uh7/zU
         4wvFaoKYQczz2w6f4lk0ezasjKDEe0vdG7KD4lKAxotGATjBqmFL/G/1RGLw2D7/sJ2c
         Ar2ZRISxYd+VKYd1xaAy41k4EssF8uk/dwMWg5m6LfH7i5Lea79/28xqVzAgwQJ0pIpw
         5Btg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658160; x=1790262960;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tvI67hzw9WhPRXd+QjB4vXvbG5CPBUup1u653u70yoM=;
        b=ktQGXU+mGg3bMbgNqFKLxaUsISlctmhi4J9SHf5431aSeY+/F38z6HH1BIqV5RKnVL
         jVNlf5C88lA7g58OoW8Fk9UBo5QOfBKSADl4CVZ5VfSggiIXu4YQQQ5hjuoDa8jPwwHf
         fnE6cQ8qAEYka2rtalaTf74gYKTjHBGYaO4TKkSMjV3+Y8LSFGZZQh9qJRdAAbKgJBss
         K/xIpKDzUYp1kMxbX/kMOj1QK/z8/FI2Yblwi3akIhQaD1ck0dM8YBaUXnYrM/7xrTLz
         27FhPQM2xXd7GHGX7/uRqjbg4TFjv9VmD0vfVuELwpIR1GOjP9vqyGaFD7xIVGEWQrQ9
         PsOw==
X-Forwarded-Encrypted: i=1; AKwUvBxoQ9UW3jcgfBKG7uChhhPvr5CfJb98RZ8SUwhjCsyfjZzKL24vRMFrOjmHazUeTQ6hly8+feFc2nnt@vger.kernel.org
X-Gm-Message-State: AFuF++lObtrYfVxTUthmX9byJOuTbzW8kuwsVOzyfWjlmVF0Y2bSD3bG
	diFwAufanolejc50FnCBfx8l6iVb7CsuNvKYbpv+TVjv3snV6d6Fo9u3h3A06TmBM3uxKHd4LlC
	IZ5d+//B8YVFFvkApzADqHvdVVeUsnxeEo5U/vA+0M7vGzuuw7tJKY8RhUAtD8gIW
X-Gm-Gg: AYBFou06sJLdJmD8NLzMkP3n5bxHbMJ8uNCaCnfpl5ILDpt7qFifa4O3IIY0gN/cxz+
	qbX8wgzngwspmLIqrbi4Jd+yR6Z9QYRisXH56A04eXzPqzsFen4CwEY2+ZZU4xoqzLM9wQrpFFi
	cx21s9OYxOjI1A0POuWCoMlxe75QeUCV1uARwRxEqhhvepWJXSExDytbOrqE9GRycWhi9ZZfZDE
	mQgYkYvaUzhMKjvIBfAEjl8Itm+nTIj6Fg4eOqXLuA2tLocdYsrDxa5N2s4igBLaNZgC0w99SIK
	qIMd1Iqg+iEd1IXn67LpWKj8CuEok5aImgoMOT/FpCcJtD9wYETinmex9UJ9UnVySzPjS8UkskP
	srXivJ9+2KlJ04/0=
X-Received: by 2002:a05:6214:19c3:b0:90e:9229:3dee with SMTP id 6a1803df08f44-9123d71d18emr133488886d6.1.1789658159583;
        Thu, 17 Sep 2026 08:15:59 -0700 (PDT)
X-Received: by 2002:a05:6214:19c3:b0:90e:9229:3dee with SMTP id 6a1803df08f44-9123d71d18emr133488056d6.1.1789658158895;
        Thu, 17 Sep 2026 08:15:58 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7659sm17152679f8f.3.2026.09.17.08.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:15:57 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:15:56 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 14/15] arm64: dts: qcom: lemans: Move PCIe phy and
 GPIOs to root port node
Message-ID: <qsnfyxmqun5ffob6g7dtfi5babmafisdzuxig7o622i3egrq5m@qf2zu7iabstp>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-14-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-14-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfX70Vye+e7LnKP
 aNRfbztPpkSM/Ce7h88gwRohcwNfJnwXH8NAo1WXGf42LCp32jq6/IQnel+jB+VPJrJuIjL+aSb
 KUhW6/LkiEVydcJBe87rw6nQ1+UjuzI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfXxJM4rcppWlGY
 FQh7gDqccFVUGgdc4XlN6m+aN32hGdGY/gKA3Kxc73HsmBSrUJtmfpD5BvJYBwwGitiCUsqi6UW
 0zKxHMt2N7HQS/1ZOmQxLvoxim69L+lDu01SYlPVVXz+q95slBvOs4MxtwhzQjjHC1AGV9lDjHu
 TFLTPms9q1aLJzHor0gv68Fnitx0XUI+cCwYxnZ9ad5M0S5Mqs/6IEV6gUvMQgAEwjyXi9XV9jk
 72oqBYYaJvUfgfXMS3XlbyrD+qLQ+ZDhffRIhCpmb3sVrD4XpnquJvUNimMAQsdfbJeIWjczhnh
 oGMNgvWoyifJuBGEdjpYxvt9bLoT4l8GDDTJcpHgGWTvVnLLv6yq2maL+p7jD8bbXuD/7oTD6rM
 d0vdWL5YMIbfGhnaGVxIIX08+aIP/fiGg2iYy6L71xkQEofNWF9AnzVOIhnva8dXCyGCdBpAuSu
 eVkFO5WDPv3ZKXch7og==
X-Authority-Analysis: v=2.4 cv=WL/qzXsR c=1 sm=1 tr=0 ts=6aac0430 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 0vUP8edcezAF6m8Fx-vHxcglq36jlskH
X-Proofpoint-ORIG-GUID: 0vUP8edcezAF6m8Fx-vHxcglq36jlskH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170216

On 26-09-17 17:55:28, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys from the controller to pcieport0 and
> pcieport1. Add the missing pcieport1 label to the pcie1 root port
> node to allow board-level overrides. Move perst-gpios/wake-gpios from
> the &pcie0/&pcie1 controller overrides to the respective &pcieport0/
> &pcieport1 nodes in the board files, renaming perst-gpios to reset-gpios
> to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
