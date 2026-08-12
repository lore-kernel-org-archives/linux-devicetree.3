Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1A73655E7
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786531154; cv=none; b=nBm+3cPIGX7bEhSBpcwsXIDX7lZUUYgkw9dcwIK1ki4RTF4EjXZhWwXyMAzY5j7RjL6QhYiEVQopOGZYgEPrnJlsem4nNlzjzNLQMXXZQouQVKQ41vLTMI4ydr7HRPZ5uDykPCkDCZ1xGFKELJ976n8k3eTrVDCcSbSB2xG0b4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786531154; c=relaxed/simple;
	bh=nKkm0p6oc4UbtPY8r9WSLDrfp2RzUDNVeje7EXajBEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jhYMOE1qHLErp1ohs53CbXOkVy1845WcySbxthZh1M8mXFP0/qKRCtql+EQSLYbSh0YivP672O2j8hTGO5hIbdMAHI9vpHJbkzVNVdDpgAGluQ+9DqMRjjNb8s+k73tBOj0BgdiZP3s7HTQESzk+XqlaeOZbHcN7o2dWNeQxURU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i9siR4Th; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dLJWlYEK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i9siR4Th";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dLJWlYEK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9foMQ3127843
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6Cf7E39uNduEP42oZG9zli+Z
	uRSKRtpL1c8Nhdz/1hA=; b=i9siR4ThXKRaz5+GM82tsIo9rCjsxowCzTZeXmTB
	wpS9ibFNK9XTwEOt5hpKNSFEoDIAxX+pO7QD26m0EbNwVyvwK9iSmB0G4T4EX0bm
	FxvD//mFzm+Lcojx/Zl+td45OzhuH36Pbajy7nhh8Jdre00YBwg8q+a1xBXXD6e+
	qB3AFZrDlwDxwoiwtNMq5SziXqJhvJ2oneB0RIJN80T3PqjJ0TAtPUk0yLeWElw5
	IDcIUUpFoG6uezL8BBXfKMkvm2yB3mEc1VPWui3DC23EGV4+QhGMGdE4SVPOUEy4
	Hr2ZqzS30avph2JhVIc+VutK758fQfuHUOh5Ss4I2UcPIg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0p3d0a1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:39:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-526da7e3c9dso7859551cf.1
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 03:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786531150; x=1787135950; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Cf7E39uNduEP42oZG9zli+ZuRSKRtpL1c8Nhdz/1hA=;
        b=dLJWlYEKPPcITAUhRk7mCBVtoDQOPk8lWCvIAJHjN1UixYxR7F8fa4c1CCK4Ozzcfs
         CXIhyUOClQOKzZq7xk03hPwPjsoXlOW3tvXjeY2WGIvASXwp7HHW7PVm+4KYggeIzBWc
         kZ6g++TwBXHIXuVyeE/mdfCmxnS9x+rcaYTyI5n+BJhyQhF//k9M9GqwvOzxE4YqPAqN
         J50o5nBsOK3k8HaVe8d6qK0XTh4zk4S4U8n2t+tNyOG0in32ybcO0q3HFfxhuu+MpfH3
         4xTVbOu+gjIF1Es3+gIFpoe4o/9ddv/P0Bl6xa26nDUUyIObcCss2juNMvcS+Ql6e8fo
         ThNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786531150; x=1787135950;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Cf7E39uNduEP42oZG9zli+ZuRSKRtpL1c8Nhdz/1hA=;
        b=hrphjQ/Js860lFqYuY8fveSmdAt/Gem9bXJH/KdZGP764v0bNpx4FO9gyy7xic+Pa0
         eqGX6e3v0bu9p829jfVbjz4pdgqSVa/C9QwXdHUS0p5gM+WcqnwUS9cMH0+K3NAzHlZt
         PIP5bjEMxSmDL9ZpQXmZmBiDkrwzJCnlFIr/uXIbNc831ByVNSNrbB/najWBCzrD2/rr
         JQWdl5V+sgU4xMVKLHgqObwNJ+yWmxPmJY3lKpE5dQqc51xyNtCT6PkeQyOrNawfRuk2
         Kvi1ZFsQg0imBcVfuXHacVeODsT1YFOoQU1MNpXL23ro0xzgRpL8PaLWdOtjfoGkOghP
         QuNg==
X-Forwarded-Encrypted: i=1; AHgh+Rp2NMhjrlcYwz9BfdFHsUM/Et876zqJODLfAa/yL1aR0RwN8LVsnmCn34uwAfSBf5+uKjZzhGwYSz+x@vger.kernel.org
X-Gm-Message-State: AOJu0YwB3sVyLFGqyiGh+32jBID606Tgp47AbpxHR8zz1lI1+lJPM9fc
	6xrmcI+1C5r9Q/ZqanQhnNnZZ/uOurLD95Jk72db8tBejAPaYrlc2ugneu47lAFnnq+FiooLBCk
	W/VVfZTMf97kuCqRyxJGt+6pHkByWHirnaeHHAuhVWtoUdCPcT6YCSre0C6Z1P7bR
X-Gm-Gg: AR+sD12eBNRxU20dOXiKVLRxGDcz877VLPlOI29f8yYuXG4m+YZ09ZVF2YrwaeIRdE1
	duD3B6xh1WUeq6RAMznunAI9pj+btPbWJnWugPOT1pNt3nDysqF9rhHX9uyaYN8ZXI5OrNIUkex
	2Z31yJxOI7CUetJNX8DheQb4Q8te4gfYQDdLyuzRidOhh7lgyHzuDHIsAdOR6Y1Vn3hz6KyXHQ1
	S1Gy52L1+WvcC2kBG22Up7kIJUOFlN9EPnVVLnwZMkSS6QL7+Ag9KBWGHSgFvc5NUMrVwMmqJ7k
	ZlgjUSQsjCnKGdNDa5XPugWGBIo0dZRwFNKLblSWua6SpLyuWbll0T2pxcgjUdoCxbbSJp+5fDc
	B+uvdZPkvFawrNwc=
X-Received: by 2002:ac8:7e86:0:b0:52d:3352:f7bc with SMTP id d75a77b69052e-52d6485f5c4mr27693961cf.31.1786531149997;
        Wed, 12 Aug 2026 03:39:09 -0700 (PDT)
X-Received: by 2002:ac8:7e86:0:b0:52d:3352:f7bc with SMTP id d75a77b69052e-52d6485f5c4mr27693611cf.31.1786531149376;
        Wed, 12 Aug 2026 03:39:09 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d709dfsm6289640f8f.35.2026.08.12.03.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:39:08 -0700 (PDT)
Date: Wed, 12 Aug 2026 13:39:06 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH V4 1/4] arm64: dts: qcom: glymur-crd: Update VREG l2b_e0
 and l9b_e0 voltage for SD-card
Message-ID: <pbqwc2wyulq56yksq4ts55vwkysmqprcw2yzbxlwyvxria53yc@5yiwjpxnkjib>
References: <20260722142342.990384-1-mchunara@oss.qualcomm.com>
 <20260722142342.990384-2-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722142342.990384-2-mchunara@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 4e1jI7-4R1gpeqbHREpDF4IMz1iYnHt8
X-Proofpoint-GUID: 4e1jI7-4R1gpeqbHREpDF4IMz1iYnHt8
X-Authority-Analysis: v=2.4 cv=UfNhjqSN c=1 sm=1 tr=0 ts=6a7c4d4e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=o07dIpAjZdj6OISZKn0kaw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_FQnCXsvKZllb7IERd4A:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA4NSBTYWx0ZWRfX/h1afY+YHkWL
 ifevQn4abeMEvjm+vsC4Fa3az7BX6rmQ42QHkRPqUH/2A3H9Tpb+hQXgNp5KVreoSxzfjq4hOAQ
 neEzXykvFHXOhzRs1w1PYsv5HxrycesZV7fjJIdRS7ax/twTtz0sUC9b5o1Dl5viQ6Cd08qGyhc
 v7XR0ygmDVvKyREY3RTCuW5MDLMp70VrK1tZvVpaLyFabNUnpOlxa3dA6BRYDUi9AFQL6sWJ+AJ
 OMZN7i/K0GR4SKSW7ZA0ct+VV1Sdqj1LXl5EzozuBI8Uz4ebRq/4cMAx9ZtbXzXSnvsoTolkusa
 KAUHAmM29iSX1sa0U/70N3nht1INBus3xpCxcKorviViu2V2uXN3RqGmrs3r64VKjy5ZgomS11L
 Cr+ckL2cHIpmhvfBjRlYAGzCYKlpIuJw4on4v1DpT/4x0lUi3ASzTa4bL7w+7+1GiI4cyEHTmRf
 TDTyzsA0IVGtKu+xsaA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA4NSBTYWx0ZWRfX945a2AzIwS14
 DPHXt1ZP2ahE8z1Feh/TLSGhxIeminPHtznJDl5C2HgFMRcypT6gPuBghjY9KeZjpRlVp2HHKO+
 2thntCvgh6S47OiTgxbCNe1dxTExHJU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120085

On 26-07-22 19:53:39, Monish Chunara wrote:
> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 
> SD cards may need 1.8v VDDIO also to be supported, to accommodate this
> requirement reduce the min voltage to 1.8v for `vreg_l2b_e0` which
> supplies to VDDIO pin of SD card.
> 
> NOTE - Since this SD card is the only client on this regulator, this
> change should not have any side effect on any other clients.
> moreover, SD card driver takes care to explicitly vote for the
> regulator voltage based on the SD card detection sequence.
> 
> Also for stable operation of the SD card increase VDD voltage
> supplied by `vreg_l9b_e0` to 2.96v.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
