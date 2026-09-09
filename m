Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5F355820E
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 12:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958347; cv=none; b=TDpyXnXtrRMJ9Qnt2Rtof3gAxXAnhlqmwgQjIwjpS85Ee4XzGRZim/xPGJmPUr8RdwmyLC83v6BRzW6wx30MscSlk2ZTB/kIgmJUGEzRy4LuQJcjLENv0n7NHVa71Iap1NpAVdH47FGumJlCumChqqjxv96gfxyE+Y8vq7jFAXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958347; c=relaxed/simple;
	bh=cXvKb72H0RorSkYji2BUaKKOmRWzyLka5DqCZ/QXA5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NYhVX3bzRCNNL0vLVfb1vplP2mJKA+6wsv03hOUNJqQV26riKwrM0BBlwX8j/eZghzjbZS1PplUN1H0a64JslMOUMaO2ureoKyr+vDNbNji0OB3Cl6LVFP7+v3bNf2fL8YHQMLAv6UBrWNMBBBF+2Uv8CVDQ1D6uV7xXPEwxppU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BTmkYS9R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JWHg3a52; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BTmkYS9R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JWHg3a52"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU4CF1183699
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 12:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w73lEZrZCbtXfUA5AKv61bGeGDgAyCOfith5TyGHEmw=; b=BTmkYS9RPRLzZtgg
	ydHh+ZUEKk15dXcGuRmGDIihvg+taWZBQvfLY+5f7DckGqs1bGfAIC79VUAxI2k3
	byuF2VDQWyiQRrk90F9SoXxf4oehlVnNkTZFj6l2L045As7ghMagDyYWQMUWlp4G
	NxVONX7F6B0aLi+v+rlzgKoO4zAJgokh+C1BNd9uMSVl269ACmk5f20a2XwjQ2Rp
	KYExKvu8bKvrUDELdWewxi/nvMa3nMH1smsYZXu7ltenxCvX2FrEmc/aid7/W5zu
	hgYwe8cEUKa9pqzRlI77lBLFrQa/4MI23w3ADSQ0YMUcRsworkxNUpxCAP4En4au
	lT5KKw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk559rnd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 12:52:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93915f50a5cso1367145885a.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 05:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788958345; x=1789563145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w73lEZrZCbtXfUA5AKv61bGeGDgAyCOfith5TyGHEmw=;
        b=JWHg3a52VPZ11T60WbD16TglPx4RUPY5SzU/g2UNkXJiydXyoM5sEQi1YkEdHVUFNK
         FYmT31K7dLV3iYyCVqswcfhQIiSbC2h/icWUVcHVxRlmgzBWVoTRV0ux++8UDBMvFmKR
         ThtjPNlWf7H+spJL/CLqwSZBvzhrdOxpgkHGWWAAWTsmpkWii/9D76mtN7j4mDLudJu3
         tuHXl0nCG+XQhsBp+of2IvJlOEoq1Qk7vM95HCOOJBt7ytmF2vpu1/VOhqrueRaIdeVu
         qNKUHR06p3w8PKeN9bj29biFvCSCJ5qszG64cVC+O5H2LFJ1MXzD5wrbkYZ5qUpe2DSA
         SSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958345; x=1789563145;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w73lEZrZCbtXfUA5AKv61bGeGDgAyCOfith5TyGHEmw=;
        b=N7itQxcn1muQwYXBG69nPDa6U7KURDw6dI0lPbONazTeLKuWJ+73coh12fkwHIKA1i
         h3lnpTCMOBsH61VS1jLXLghd/W1cWYBoI/R6g9ykHp7sUYZv+k/jPYGiVd2xdGgMTm+D
         yQRM2fAo0zZZzznKVdebL82Ou0qZwPqY/uhhFyqom0XuFizu66l0k3ikaMizdfUvOM6X
         nvBK6nbz4YLiWDLK3g7MW/UW2nyJo3GJac/cWktyjE4QoCsrkPLxvsEgPeO92gJ81xnT
         qvU3skXC91yGWslK7zHB5weJnzuv4lgih7rtDur1kQyLL0t1kSV3CV6hY/dv2BIDTRWu
         4NIw==
X-Forwarded-Encrypted: i=1; AKwUvBzO3dG8iRIM2Fy3LYzUITb2qLn2okfiqw9n1xo0oVJFkf2i+mEEgCrW+qcfmSo1VBiagZ35NhTaWktF@vger.kernel.org
X-Gm-Message-State: AFuF++knqPurQPsNNEXLs71HjaUkkRbaFEoQfgi3coBGSepzTCn4GB9e
	lkZvgjjI3hsC8m9nSEtzWxQcI9dEiGKIiIrI4Wf9AYpiF2CgtiTgVc2hvLuHaZyMZkXa+4ob3sh
	RZH1LwxJ6YOm7NwjgIbdSgGEi+9OCkbGFXKjFwS0GUnBJ9UHJyW4FR6sJ2NQ0mOxv
X-Gm-Gg: AYBFou0mZLcnhp3+8Tf6AF2LLLXS3nUi/oL/QwUYHeEIQii2cyDcJRrmnn3whOVlKHn
	FoWKI7ajqWM/HrhLgRKcWkvwCxsbT6r42sMnizQ29RKrSzANA4YN5Yng3b+/9MwKOh1fbQesmNS
	c6f22qJqClptjfDNwIuevnHHvKcyxBAuO/zBcUurjJFQ11FbfeLdTFdLBeCEFKnRjq5w1+pbMC3
	L0R4OCFOi1fyoyryBQ0l8nvVh8nLvIvVXgQql62jeHaK1lENt0bywqzMcR79wQHZjuC4i3lOnfK
	eI+jGY+74NxOwXnwSjoQ0yMseav6jHL/v5nIq/WSOgiNQwfw4bLdHpNeBEKFdGJvSYidhu2ckHQ
	BJTpIpEvIVeFHUOGLzZxJQCdk9iE=
X-Received: by 2002:a05:620a:28d0:b0:939:72cb:bae6 with SMTP id af79cd13be357-93972cbbcc3mr1268631385a.29.1788958344807;
        Wed, 09 Sep 2026 05:52:24 -0700 (PDT)
X-Received: by 2002:a05:620a:28d0:b0:939:72cb:bae6 with SMTP id af79cd13be357-93972cbbcc3mr1268627385a.29.1788958344263;
        Wed, 09 Sep 2026 05:52:24 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:de8b:7fd5:2738:cc2a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4aa0b9sm768027666b.11.2026.09.09.05.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:52:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Muzaffer Kadir <muzafferkadir@mainlining.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/2] Add pinctrl support for MSM8952
Date: Wed,  9 Sep 2026 14:52:20 +0200
Message-ID: <178895833828.30492.93870770541896598.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907-msm8952-pinctrl-v5-0-9a2d8d72ffdb@mainlining.org>
References: <20260907-msm8952-pinctrl-v5-0-9a2d8d72ffdb@mainlining.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KP1qylFo c=1 sm=1 tr=0 ts=6aa15689 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=mPusQoNMmh5jHkL4POYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 9Z8aEMkoZtnT0XYXj_J2ptNDe9qIVYIS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0NCBTYWx0ZWRfX06BGNI3m19mn
 olcUEl7L5tHbPdhM7k40mtOotzZUuV5/V58LXWC235QBMLjhLpoHlaxfrbkrSjcxXfn4pEuvnCJ
 NLsgDiZGhkhk4/LSRR1+P4FH03p4lNo=
X-Proofpoint-GUID: 9Z8aEMkoZtnT0XYXj_J2ptNDe9qIVYIS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0NCBTYWx0ZWRfX5thfjwhtoBCF
 7I+7rWB6fu/SanOwhY5VrxdRuxtUyvz9N+TeIRXAlz0IhXAAVgagGudJxGRx8WsQh+4c0mPS/Ed
 aEk55aGqrbEi0LDDmkonifHXy/+tZzJjwQizrr9+FEL8k155gIkRFI5IjN+uusMzGZbT4e4vacJ
 Y8rRRCDGOnKAJbA/oZesJttCrEUDJz7Tt7qKC/q7g1HxACLIrKyZrwBbt7SDZ9JY9LFviQo/hLH
 cjRBgILdQP1t2SFElsg65s/7PeGLoX8Iawz0Gm7wufADYdJLx1MIwXbh5xKSa2eWit4RUJg0fTQ
 CvGP8We/onNFBOfFP2QbjuuIYwBTP7UjMLYuLG0dvu92eS7t1qt+hVUCKTNwA3sZ4zmngaV1Dqo
 PzdI2NcI3P314GAJGr5t5l2HQUGdJHR4+UZLVVB/Mq8eKyMr0oNj1Y9Ya3sYFvuGYMOV8NVYekL
 cVcrfhTR1G2Q7a/YiCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090144


On Mon, 07 Sep 2026 19:05:23 +0300, Muzaffer Kadir wrote:
> MSM8952 has pinctrl system that is similar to MSM8917 pinctrl, but it
> has some differences in some of the pins and their functions.
> This driver tested on General Mobile GM 5 Plus.
> 
> 

Applied, thanks!

[1/2] dt-bindings: pinctrl: qcom: Add MSM8952 pinctrl
      https://git.kernel.org/brgl/c/2f006f5c617a56afe7683b607727349e0aea7814
[2/2] pinctrl: qcom: Add MSM8952 tlmm pinctrl driver
      https://git.kernel.org/brgl/c/b53a6210af0fe559670e298349968beae2c7448b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
