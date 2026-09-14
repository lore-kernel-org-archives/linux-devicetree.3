Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15575421224
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388698; cv=none; b=WYuPseWsGNYFoHeoTCOP230qzzpfV3ffnJugjK5FqdWRRDHZCevou9FmvnRQi8BUSvD6S1YP2WuOyfo8+UVtozZ47yMJfV5yIsCw5E66pk/awxGseMbqwk3FA+M3e6FhdFGAxqKGWhjjxEIRbxuOS61G123NPB3rlGwbQpaN0U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388698; c=relaxed/simple;
	bh=V7li5Dw9nmkHeY7iCABC8exOwEM/gxkTUPUJ2FR2iOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EHtOBO/dmWk8XnTO2RbaWphdjsVx3NDHVf44UezL025rhHYLz3T2YSlK5LPDg8nDOUKSH/hnAXRYS62t5flD/bEa5zCNjJl9LJqjnyS1APbAxdmwhWS6IjVavQHmc5WrFa5zi8H8EZfKFp4mLAE7ItusxUUC3Oro0ZaToOtACHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=orAJ8nvz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d0h0+vYN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="orAJ8nvz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d0h0+vYN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm7a13793323
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=; b=orAJ8nvziqXVDna+
	14nYPxHLwwYD9PWfjcWwoK4WlFeYkXQg3MKt8K97GxytnfROYZvVnj4ANTPPbdOW
	KPSWGN0L4Ne3nUmEd4UZzqXBB+RssqpsQo1bejPV3zd2BrpJC9QQF3OLLU+8Rw/R
	4mZGz22nomRxIFLoRcKCZ5VE15GIFnBSdqPDlMWdcHe0xJHFQBA5xgGXO82kFYcl
	Z8a1gX7GTAhDPbHyzjG0LUgUaxMgr3D3PhtnqvOqYFPV29hu+uCzd/UKgfw15xDs
	wAGXTnuobbl5o+5S2jfwGoLhp09GOACclAL/5PwuXAAqEcO8h2ibbeXpvxOsuqWq
	0kzrvg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg134p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:24:56 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c97b57ef2bso22532e0c.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388695; x=1789993495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=d0h0+vYNvCwj6WRNui9GF9izETqjzLEFHrV+5O1HwfPICUl717r5pb7NLVxNz+dONE
         q4IxfwhGPefFqyBcbXAOP2OCaV0aAi3rShTc50Bovm5diTW4CQMfI3F2OFUfBWffh+uB
         VnQy5upKgAORsYZyx0hzTl2E3+gN1Hd6JGXAvNLyQqwWwInJ2Y9voGDwTzDA/p2WsqBu
         VwTEia/XLVTUT7jyr+97iEksU3Gk9DNpKz4nJPEgwK2EE/LrRquRS1tmmAVPSoKMy6eS
         W1clOT6AvBfgOpc3M2PU51dQmH16CLTEPdbQcrVl1Q93VRZUJubA+dfgUsSx5Lp09Tle
         tpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388695; x=1789993495;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=CEQYfAt98eU5p89YNRRaKp3iGI22H3dl/rBFPJCiZT6DdPbLSXvLZ2yYV8+KnAyW8t
         mNPYFqUAt+gczV+BwTwzNT801LI+zUjesgvg0Y/rML2lGue3goY5TuSyg+xSFGNaHJGG
         ebKIZy2NWE8hwdX3LkBfP9Bm5bUp+NIAde5N2LWbIdBBEfTaKffGJmjxrZejiPYOhan0
         5QR788b+2Pj+Wwaq+HBXKZBAhbisBKGQGN8EyRrmGL/Abe1zXLgghrGFaoj21RBstI4I
         HI+N4RX1kZo0ho/QpkKSjtcuIIjIFJwNd/3iB89ubOj0OAjP4gEzcitIgJNH7g//Wyv+
         p5Cg==
X-Forwarded-Encrypted: i=1; AKwUvBxdYZFlIYW61IoGdA0Y45wPEgNZLyfmUL3j6kMO2chdHGQBczOiCy2JAyQsl+sTOa5YLNrpRfUO+aRk@vger.kernel.org
X-Gm-Message-State: AFuF++kgELD657RRSqdEPk12WHK8zA1Xl+WrP2Tv2VqgPo4QXfkQp4A/
	eyMzBY05v7+nPziI6P4+TjnPpM6k7X6PhhyW+LiWJ1HgwtC0M0xC+aSJhM/j23kmRGglHVtgDUb
	JdfmVJr0uoQZnSVQCXc2uNTdcgrPDDqa8qx4kZUbUBVHMAY/7FVJ7nObHDXShFeUI
X-Gm-Gg: AYBFou2YlHE5bKR4cmOPUdwS2RGA3iquiSRjTGBK7P9Cfvf8e+UGfDc4jEASZEcb4E/
	vJHczfoW8ZbUsWph8+hCH+h0hwax5flXDdmhUF4tLpO8cne0jxMWF17/MB1QLemTOEkOe2gn/3M
	VXWLz0fslR4YrM1xX+D1RTUYfern7q9DeOMS0WNUhCesAjDmk++62ct+pCAMzH5FsanRWFEviDj
	+uAD6S8Vz5TFM+mf0ryIV6lI8/0KHJxXIwGWGgtZOZ+WuG60DDhSfkUX6LAKOWFNKb0F4EVw5EU
	Pt+5gwG/W7NrIF1uKKmhkPukikF1YM6VDBYjKMNCSksiMh2wdNOFDqrWyJdb5Ef2tk4ZnCCNo6h
	mH+0UEBQ0ktG3A/NFtdUrKw==
X-Received: by 2002:a05:6102:5e94:b0:79c:86e4:6ac2 with SMTP id ada2fe7eead31-79c86e46d81mr124197137.0.1789388695258;
        Mon, 14 Sep 2026 05:24:55 -0700 (PDT)
X-Received: by 2002:a05:6102:5e94:b0:79c:86e4:6ac2 with SMTP id ada2fe7eead31-79c86e46d81mr124188137.0.1789388694856;
        Mon, 14 Sep 2026 05:24:54 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047fd4fsm2356557e87.82.2026.09.14.05.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:24:53 -0700 (PDT)
Message-ID: <9514465b-8b23-4913-845e-8a0ebd7aac83@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:24:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/31] arm64: dts: qcom: sm8150: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-12-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-12-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7e798 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: UgtDZMmivbYcNgwYS92UqRiOqA4YgmLI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfXygc32idjA1hY
 8vJ7TuMQrng9PrHUA39aCroaRLLVTeFMgN8WQmDuJBwUbLZmzN5K8n/AH0jBhprXR1/IJOMv1CW
 OzNzCRfHpzvhcqqDnDfFnw6MS5iwcNI=
X-Proofpoint-GUID: UgtDZMmivbYcNgwYS92UqRiOqA4YgmLI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX5V2ei+izXX6E
 tItjTiOBOrEyD7xt4KK1RJHxCHmM5gSL3hi5RpLUHTWBTmvT4m7BJIMefZiQBT2dvKSXxorKIpJ
 kB2TtzAcMDl1j3u3M72Y6cGmL+/AyvwnvDylYgFKTTpba3Z4/CVS3dLZeGGGMzgNw3QAidlc+KX
 aEaQQDBwK3wt6NWKC4B/L5UB5mOXaXr2iCxC/duPOS06Va+EfUp5kl/r2AF/giOzjaF6uaVk47E
 gXSNEntkew7IpLTImn6SWa436nzRKD5L7i7imvnuRgLVa3nchL6MNx9eXcL4FLxAOKAIWlWrFeS
 wrr0VK6HpMdRBl+9Y5wTQsWFy5D65Vmy7dzkwxWIcwq55Jdydf08rjTQ441squynTnhkiUQUIts
 g4L/iKCLcaEomEnpWQ3nmeNz7E0BVExbpnOLZuAnfj5PHI+qiYWy6fFQBAjca0FWI7DIcoOzoAs
 pzWzDPP4hA3ohv3WLrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
