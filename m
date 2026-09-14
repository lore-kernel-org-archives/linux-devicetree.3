Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D023E559A
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371258; cv=none; b=JzxY2GAvsNskkNQVPEkIB05vzPz7EHIaJTli1zonCgBvcyGOMRjwbsnmm77az1YDWHVjrNJ/UOMInedf+r1GZ6aePt9LRturTJsEhwJr7ASregQ9mjqKg4cnoZOeLSSmj9bMa8y3ZK4/mopat6wzJRquB1Nj4gbrHGKu2nHxxfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371258; c=relaxed/simple;
	bh=1ey+7BuuywOfPmHLIz/6UMXpAWTAVAah4dLipk9yDGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=prLqE2ERHic7KECVJiU/qcI2EssRb7G2rOmLqSQdobEte+dvgWyByS7pYds5MEqrRjYoGlfF5LJrkowknBh7ADe3Qo85qWGdcWaMLBRDMAGxpDIfi4q2uXxTAi4upN05Xou4aIJfZ/YumDQddRrYmhA01Ya9mIMe00hR+3J71a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PA2vsX75; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EWhir8oB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PA2vsX75";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EWhir8oB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5iwF53739615
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bJ0LnXcfs2eCKZrtoDG+orKK
	jrb0m3XGM63JVNK8OTI=; b=PA2vsX75z1gcXpghMbiHotqxgTQDNnDbIsHtHarI
	T7SqbpFbUFX8pXO81QdcRCdey2Ab/gzWuCCBSPDoE07/1yUzVasxgAA+inrPNizL
	trZQCMAIpAomS50ABkai0L8lVVlPq7T3GKTLute9cmz+TrPTlixL1TgjDcMIYDZH
	ejuaCoFEUWLxZsnDES9mlg/qtdsha/m2D9gzlG9NaDDyNFXKHEGPAl9y75nYmn0D
	2cMBHE7XzGOzPVyMufcSGX2OmP4tk1ie84AQPzzfCMM7qy2FZoewgsOysasLj/ez
	BrUXzuRj5x9w1NY6C1yaXZvIJcpBY3ezZpeYVlxGKm8WUw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ddhrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:34:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so569594385a.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371255; x=1789976055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bJ0LnXcfs2eCKZrtoDG+orKKjrb0m3XGM63JVNK8OTI=;
        b=EWhir8oBcpBB9HwQvs19m84Lx8xJ/hKYIVV3jo+aZs3k1cSfuWO0bOyMMT2bLkZESq
         evoBakU1+OCTc0YnNmnN70l2JlX0fX6vktLyuqMFj9TzbW3HZFNstEAiD/1g5oS8J/cJ
         IITA0qCYg7nz0tq0Nrs0PHcLTljPvQb3BGuhKJLpQpZPMuXJb4Zv5ESqs0TeAFBZ+nsq
         FMaJdM1D4VphEiVTCiPI2YlpQCuGmH+MtDkPbcztOeTBh/hrKb0ptCKvoEvXyT8TRGqY
         lHQLoYdCRJ35Bhi+UyL2bBd0eQN22ce7E7L0G8nQWZ7JuXiWQMLBSMeHtdPsjXXtMge7
         ljPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371255; x=1789976055;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJ0LnXcfs2eCKZrtoDG+orKKjrb0m3XGM63JVNK8OTI=;
        b=WIhmYzUSziUYeGZDIzVv9RgckBJHtdCpXYgdfJ2FtNfyex4mofmhBPQoPbQY/hbwgO
         0GsUqyH4UFRc8IkPnow8GNeMWQt7iKvla/LmnA+kCr0vGpD14mc7/lI+S3TAm4+kojOm
         V7ftd+NqV0IxSqUojegwud4QSaRUauJ1Cq3xDbv9rTWh2ENJOC/X61mFR/9yqF1aZFD6
         necBZ+gnn10bl5c5i+zNhUUpCfSX029NVubTG2UtaCu9MIG0rh48EBqonYfw5gHI4Nq/
         1XGZjcQt+shqDUb6nVDC/QaDcOIqY/LtH4gy3+gCOEW4aIGw1x3LL16mk1bDAo1NblQ5
         thjg==
X-Forwarded-Encrypted: i=1; AKwUvBzdAuy7vrre6buUGiZGF9q2piZ+HOJD9SmacGiSKWvmWeT+QUTHiNe8SqMXbHDcc3W8kYs0W9dWS2Jn@vger.kernel.org
X-Gm-Message-State: AFuF++nr7hKICVPuR4uFUmudhVunsg7rsjwjgw2KnrG5cpov6vEf8JE9
	28rICL+9wwsstQrsT1Z3w5CA9AT83nKaIBhn6TIV/6lDU8L9K+8nwtImrUoKJijTRuD8UwTgMK7
	xjK5yo6d6oK/D7SQ8knJMwKqVPuzDs3wRm712YaHij405bI9TPWpylApN23jojHJF
X-Gm-Gg: AYBFou37W8q1KTukatgiSi06Yq0lfDVKuAvhl/rzCrM3M4D5EjO9zN8FGTr8Snryy7Z
	zGdD8zooKbt82SPCxeT5/AZghdNBnEEYMway6N/ac1Eamo0bE+foPUI5qhaxHqb1tPrv2YBN665
	FCHW9En7bf6mq3Uwm7suNCNE+451VXHR52MCk4ppClPqdMNLPi2axNrK/sAvKf1hQhNdg1aXLOv
	WgXLKMeQ1a1E7Hd/AMkICjW8jwwjZsJLwmXuR0ZEyFV04Jxn4RbGz55VWGwQxxw8dy/+Jikrrme
	qe7qDtbIGILrN8euYVg2HzRFdCBUjNGLPY29f+euGROTy7mbCm39ptiviSGuwXsMzP7UHWs8eWA
	WIYweLMXIxpw8pA==
X-Received: by 2002:a05:620a:1788:b0:939:f27c:7433 with SMTP id af79cd13be357-93a29c132f5mr158406485a.50.1789371255012;
        Mon, 14 Sep 2026 00:34:15 -0700 (PDT)
X-Received: by 2002:a05:620a:1788:b0:939:f27c:7433 with SMTP id af79cd13be357-93a29c132f5mr158403485a.50.1789371254520;
        Mon, 14 Sep 2026 00:34:14 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35f3d9sm24084717f8f.35.2026.09.14.00.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:34:13 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:34:11 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        mpearson-lenovo@squebb.ca, sibi.sankar@oss.qualcomm.com
Subject: Re: [PATCH 2/4] drm/panel-edp: add CSOT MNE007QB1-1 entry
Message-ID: <biywo5isdeagqu323ozaleeakngl4sngps4v7ngwqo23ju2sw7@jn53hxxuccff>
References: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260913201835.250085-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913201835.250085-3-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX/4xBuVc53ZnL
 6bAAbzSTy2dm47eVwHFVUMftZqg65kSQURnocIoYSGJr/IB4Pdyb2fVefq+1FaqaNbOIENHqXf0
 58mpgVwdR/foUuMQYHxOL4EezXdE5RWH9/ckFvjpuSmc0KImqHW2WdUWeqw92w/pGlVXagiqpV3
 aBvRDhJeezWgnP9jMHC3PL4mwKWVU4CvUM3k2L1q/M953dY94fczo+PIgONk3UHzmvK8MH0ptrX
 a/UYGMvSa+Q24e2+cAF+rKyxpi5UwDlHcULHFiaYPioxzxQtg3riE69HlEB1dkIwrld1cS9wh5E
 8K2xD1y4cOhzQU3kaDsi9UUn90bnFt4IFqHg/Afz92gI+8bR9PLrdxzD6cm2didqdEYBo62NgPs
 0XVvuAxfpaVgTz5pIiGyORs5HO7xRPUtO+Uo17F95c189BBCyPz6DFCOO2gPA65ganyQyyvDhpw
 Hvja6rN7IE9B3BX2/qw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX+8zwc2wLVl/f
 RO/CwvDTmDDxQ1F86u68p0MI2Qp4eMwtXIC4YYEdBT2gkUNRa4XG8/3AEyzX/ugzTVYmgTVihZ4
 +5ikeFOQSbvD1tq/DCyxIDM10ldzeI8=
X-Proofpoint-GUID: d9ntva8Q5ygUigJf2jhBsZYhnnn4w1QA
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7a377 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=PY3c6-KAFs37oqjDjR4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: d9ntva8Q5ygUigJf2jhBsZYhnnn4w1QA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140106

On 26-09-13 21:18:33, Srinivas Kandagatla wrote:
> 14" 1920x1200 IPS panel used on Lenovo ThinkPad T14s Gen 7 (Mahua).
> Panel identifies as CSW 0x1465 over eDP AUX; uses conservative
> delay_200_500_e50 preset in line with sibling MNE007QB/QS panels.
> 
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

I think Doug starting asking for EDID dump in the commit message.

The rest looks good to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
