Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDDE449B34
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388535; cv=none; b=e0zOEL1VdQAKE2Mt6jlyEt3wFgTDeyMM2c4LnlKFZ68dQIxMxyaVHbbxjXcsTrs2YrdlzRqwxS2uRKgBHgkXkNTOzQH6RN6Khx5Awu9YNAceV3PZ+FtKwZUtjkJY6UPxW5tjA7CxlcTxYGs9KMzTuGPosMSPsYLpu1rXARKTuFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388535; c=relaxed/simple;
	bh=V7li5Dw9nmkHeY7iCABC8exOwEM/gxkTUPUJ2FR2iOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZLQDaxSdD8gEd0HIEcOWvl0v8yp+cpwHWk8HPx3bo/zJDXy6aiEaNeQF/Tzckm+bscwTKh0YbwMUn0iPCS3+tuKs2ZdzcBfvQk6YJJ89QiDyOsWXpjlXb6TdkwLxglxEB4YdNCbcOGHx1a7coCL06hux9PB1dTLISm/LSD8JkSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dVa4gdRy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=STNDUwEd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dVa4gdRy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="STNDUwEd"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EBRFnC406712
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=; b=dVa4gdRyQPwlvKG5
	+UIyh/ogItCToVnPUkSE/evxRGDqC+Fyh0obLk9UglNDzlCfPWZ9I0lxsnoNGVhc
	EaQG2mucCqt0iiZpexSde3HhP6pW44RhIUCJ6CvlGGg2+RennqV5idTnx3ii8CET
	taeqyWAR69vWH/4QFEkLXJACqC/yNJwF5LKAbxVdA3vJvmAXBpT68zqI8vPdcc8q
	pxMADc69k6roQu7+jhgv5jTCr6oRqc0MEXiUPyX3T9DO4g7R8FXx5+/uedzObf7x
	8RMHOr48hRws/Hnmh/mfqLpQjOjytGcemF2CKEdwPub05hn9Hf/AQQF4CjZJQi94
	MDTOnA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kr59w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:22:11 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c8383e6a13so56486e0c.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388531; x=1789993331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=STNDUwEdGSLp6TJN980yWMv32uwN6+fB9WWzo8Tvxb+lYxHhOF0cwCMnVXKll0ZHIr
         mlnt/zG7ZwdqafdBZIFc69RkT9mFMOFEilsXTGUBUtRQVpuaIsIVw9GEIiKG7zHUivEJ
         JQYLa2pyKc3+RIb5xEhQLAKU7LOjzqPnkXcp1xEINn+h8eY9T3roFszQaiTX4YkJrLUD
         lPP2tekek2QKE/yJpx5k9ClVHTehpqI8az6IeeylXK/DSdg6xPFOMvvfOnK+N/NhmXWr
         LAdDkwMqYvbQyGJ5UcyDcknvx+cXBLvVYSLCJssHIFCeySYdoTBWLy1f0+7E5s3VAYX/
         c6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388531; x=1789993331;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=BaM8fBAZQsOLehDRJdfG3pIi9Sbn2rFozMCVytOEI4rJrQLtEm/2Kzdfk8zQ0kOcI1
         9ZZ8AwIddPPoj7PFcEeCbY+3mp1Y+OqnY+2A/YzjskUxtJ4sy+eBZht/yftDHrbgmoro
         5OxK18DslfbLBTM5g57Rr+IqlQ8OwvFPVF/tWvzNhkJCAckq3PdfuuDMcYTqPPiDC/T7
         xh3xd0/Hiuno/3HRJZbV3mQW0x/3Ab/6n7CHSptIvJIy1t1p5jEssMwA1aqXJwFy8KPg
         LBzijffb9cCy170K7Yi4YpKnxo7J/DA64o2tt8scfBzHiP1oh6BufB0AJ2OprWnl2ZtE
         Layg==
X-Forwarded-Encrypted: i=1; AKwUvBysABCoyhdhc95oTdAiARn+4AQ3LkqgHoO3RbH25RJv5vxOgS1V+jWuI9z0oI9nOlxMLMWg+G+xrEU8@vger.kernel.org
X-Gm-Message-State: AFuF++nEjDVzal50JSi2Yk1oRWL5+UsZlixutcxY/4n66J8KVyBPRSh3
	qaKITGJwD8pSCqRdt7MlJ38kZB+tncKVePgcQV8QGDhtW07bHwN6EwRik4xFcQMyCcmaPJJJGbC
	eauoTbgYnU/7/e4vSJOoZpO2FTyXQMn/1Gnw/KQyaLRyNfyXEl3QuK9NUqPOT5mnO
X-Gm-Gg: AYBFou0iFYsDeQnTTL9RNzsTEeU3OUKM2F3gZccpjWbMXSRBnd8Fcm+nuc6eLpsabkM
	7osH5DTexc/H7QWziHqZyD3Kr13VjUNg0Aqt/jDXgjpc77o8x/umnuygiQ3hRgvPkjrrqMr6aLC
	GUpVDjgP+6nZmI1sZBkBB35VCyqgucPWX+gtVeUmF9SSjHBvaHQBHhLp2jofNEff7Ejjw0Tk72U
	xzq/ZvpmmxENXm4fK7ruscF2r5N8Hb14VO2yvy8xqK7mjaSagnfKcsOx9MfkQbeViltWWKf+9Hp
	SvQaNuoD+KYcOMkrYEwQXALLQkj/O6sZmuQwuDTFVanugQ1Bjv3suEMIP965jNQuaCpa8RWx0Bj
	n/UUd6psYJIIvOyLu0APxHQ==
X-Received: by 2002:ac5:c8a4:0:b0:5c8:369e:a493 with SMTP id 71dfb90a1353d-5c981a821aemr376390e0c.1.1789388531391;
        Mon, 14 Sep 2026 05:22:11 -0700 (PDT)
X-Received: by 2002:ac5:c8a4:0:b0:5c8:369e:a493 with SMTP id 71dfb90a1353d-5c981a821aemr376367e0c.1.1789388530626;
        Mon, 14 Sep 2026 05:22:10 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0471b6esm2391714e87.59.2026.09.14.05.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:22:08 -0700 (PDT)
Message-ID: <c21c5275-db7c-4606-81c8-87832a2f8104@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:22:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/31] arm64: dts: qcom: kaanapali: Add domain idle state
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
 <20260914-b4-idle-state-name-v1-3-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-3-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4GVJ7Mt8Mmn6EunPlFBURIvLWQbGoO01
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfX0Ni1+qS2Pt+T
 HlSO2ztiMUQrHtlxNoUIDf/ohfhNRz4qitbFjgpNe1pkqofKLUwzR/s/Kbj2kBoOSKiAqZI1Xj6
 9lxBLIuTLAjhSmDMvrQ/UXlfwRC78w5W8iEXEfJb4EoBn6qIHdYCr66w5h/jCRLopcb48lJdWqk
 FNNtO1M/TqLWyG6d9pe3wn4MyPy/YhnIhMRALh4F31m1T6kVXm2rBTi5wPAhI+LHeLApgUeCU9i
 JbJetgMDcYun+qmQbXL7gdxa9Jjkd2FyXcO3FSHpx0WbBMp9YqnyIHYblHI1NOzR3UWK6B77quo
 AXHDo+4yfUPXC78pj6gAPo0QrrGDxcVE3C5ZYBiO4RfJC6VpPOKEH+EYHM4kZlhVhgQM2YD2PCo
 Y2RUXmBbe+gEtcRreWJpO1rHrrihg6YNna5gBSnBm/gDSdYVndCo+4n8/5UIYlG4+TujMnX7DeP
 CMbg4HUaPuY2EHKFm5Q==
X-Proofpoint-GUID: 4GVJ7Mt8Mmn6EunPlFBURIvLWQbGoO01
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7e6f3 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfX1ow7w84/t0ia
 Ny2sQPwyj6sugqWryfy8v+S+w0m7/m4y4iuUH7EAXbFxgtxGOXTDYlgTIG+igYnMyA+DRYm4TKp
 pV95Ayw/10sibiai2xDBG7LO4tnFUzs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140174

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
