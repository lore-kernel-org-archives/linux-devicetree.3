Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A57C3E8698
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 11:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776943673; cv=none; b=Eo0GWfWQBRbNlrA5+zVgnEwLmM4yvUqaMU9q7qwjLtNzSQmFpKrPsa2cW1FdWJkwIHw8Z/8/M4CgztE89nyD0YRYXxAyhYhZkTougjnj4LNdvPHyH8wDuxw8Qx6uuF2OAQHadgG+fclssVMzDkilnG58ow1U77ilgNVBQD/TUHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776943673; c=relaxed/simple;
	bh=97LBoeTlSSpR1cD+GmwGTnk8fuaoiwUW19iK7puwAWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WLbWK88q+eS5NCCyzwZ362U18MlaQVT7JnAuoDuTTh42T0NLov5IN14yuWaZVO6MH8A8BaKd5GkbxhXtQm9r2AO/CjYE3KNqIh6O25TlSDVjOGeDt4KFB1s5VIPMC2fixIfWsKzzESofRgJNsdjI4EDm5POKDSdwBAp8lB3NiBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OUvT6d3d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bPTt+HPw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OUvT6d3d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bPTt+HPw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8twC2028926
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 11:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	97LBoeTlSSpR1cD+GmwGTnk8fuaoiwUW19iK7puwAWU=; b=OUvT6d3d0uZmeeCx
	gGFhtwB95RxMMWqGeE0TbnekCbnJoKeQSaYNn2YJqvcNAuyCaV4mZLec7snm0hOl
	A1mPGZ8DozFrhGzZVwVITxkrjb56H4708VoZrK+wNvomClRM6+hD7AM79SCkI+6M
	Zod2F2HOcpJ5AD8Hzj+HwnvRrxgHT31N8dMNmwiFSbwteoukE6wFqTmoFlB/rzCL
	zo4shYkxqJcBv/WclGjv3bmBvt+ntO98gSTI7zJaU1HcOgpVqAlDL28NWEgfCIWG
	YCx8Ofo5nCDMXnK5+zODyPKKNVnTlPwRkxxdv2IvjORcNkpR0zGKJV1RPnx1j+Ig
	Hw9z3Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqdjm17je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 11:27:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50edf0245b0so92711241cf.1
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 04:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776943670; x=1777548470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=97LBoeTlSSpR1cD+GmwGTnk8fuaoiwUW19iK7puwAWU=;
        b=bPTt+HPwQD2lvmnQCuP03hRgXGm+szTQDzJLNA/LNJ3NZH6i9P00nDdVb3f4pb8aSA
         apbzl+OnD0iT9JYzvI4f1sdiYMVcWV6zmZhNbSxp5ixHwc7Lps+y9fPKIvjtKTBxLGcK
         Xi5Cw41IksXWBkSwI1k5agH+pnPGGdsdfOE8CvVv+2F6CoMFphZkDq8NS4uHD8w0Dl6D
         EsInjwdX9007ZSLJnsWG95o0JwrwFlJf0awbRszJkocCKuSIvY41QK6I/TtLQ8MmyovE
         nJ9TU1V06oh3lNpM+AvgG23ZZ0nHZp0oGaLxqwoUkneN/FUuDCJZryW6lDfQS3zPD1d/
         CUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776943670; x=1777548470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97LBoeTlSSpR1cD+GmwGTnk8fuaoiwUW19iK7puwAWU=;
        b=C+MWgtkNXi3FNnf1RiKf3XLXeHSuB4ZUAAGDxPLjGhHlnR/MNHR08d5HE/U8cmTIkJ
         YAo7s4tsE4GuK5VnVv6hEpJ8iW/zbqmFlMA+EFpLZxiOtzD3eNywMEb1A+Re0BPuax3A
         AVY396ap75kKwyJA2ICr2FrSirwX2h88Rv7FFwilI8Z6T+T/azonm68+oa+5h3r0PQZ+
         9Dh/s1d7Gucha3QHuGpInJbClmIVwIvnZP6UTrWMh37ZuWG/gTT806rfKiV1tBXHhyZz
         H2E/TXa2ENFGW1oZtOr5OUwbM2eHHF6fNpELjtAG15jowr6q5LFKKbbsoIgwORWbSzpE
         eTSw==
X-Forwarded-Encrypted: i=1; AFNElJ+F29oHkqvxCys+WcVEE501FkNEsns5IdrplbabyniFGOED0/y/6q1aynaTgX2IaVPZfhDI+YxM5R/5@vger.kernel.org
X-Gm-Message-State: AOJu0YxrCxlgHJvkMLw4TLq9qQnax02VtlNzx82H80fd0poMJP5bzHem
	/T/GWVyQFhDe2zGC4GChFAT0QQlfBnGUQCpr2wPXwgIwAyhKlRUeIS4W7K7clIDbVOVxGMilGVb
	081/uv2J8IDYqwdpCKmzz15G7tHGzcsGAXE9etJoCaXiAvFZ2gi0NndGZ8Op849kz
X-Gm-Gg: AeBDietcckW/9G87elOF7eke2U/8CXptReT2HQRQmOhYnPBbUNg2F3wKIkmFf6RdEyk
	w6lQPFspfAXcGEzugiHUdLRM0QFnzl7JEj/6OECCDOtNpoPbA3FcK4m5M+IQ66VDy5to/TQIVGM
	Q96A3PLqFHEd8lC5dCL48zfT/+0tdnpmu54PGw3thyMPrV+kRYsj/zCk6YDbNxQ5KNR6JpbYesh
	Yco9RxZ8JEPQDXW1/5wvY16fI+LrpeFJvf2ZIJZwCvSTM9sM/VoOdwjyJBGek2TNUNAmWcx95Mj
	LISKgiaoKNgF7kyG9d9FcYJatu6z3dKqAPhGeaj4mS41XCrAHWnePtlDBJ0z8slwWaOSmMdZHzy
	HjlFemaEAL7K/TCW5G9BK1nRhpth/4RJUddlWhlLIZ/e2MUEKRs+lJEMVohBSbkOYr+IRzRHfwN
	AW7z1XYdavZZocMrQCRrk=
X-Received: by 2002:a05:622a:4a18:b0:50f:783f:31a6 with SMTP id d75a77b69052e-50f783f364fmr209899291cf.38.1776943670402;
        Thu, 23 Apr 2026 04:27:50 -0700 (PDT)
X-Received: by 2002:a05:622a:4a18:b0:50f:783f:31a6 with SMTP id d75a77b69052e-50f783f364fmr209898881cf.38.1776943669948;
        Thu, 23 Apr 2026 04:27:49 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a52583fe7sm221213495e9.13.2026.04.23.04.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 04:27:48 -0700 (PDT)
Message-ID: <b036d5ce-c6fb-4e8d-8baf-b580c8c952c7@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 13:27:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] dt-bindings: timer: Add StarFive JHB100 clint
To: Conor Dooley <conor@kernel.org>,
        Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Samuel Holland <samuel.holland@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Emil Renner Berthing <kernel@esmil.dk>, Yixun Lan <dlan@kernel.org>,
        Joel Stanley <jms@oss.tenstorrent.com>,
        Drew Fustini <dfustini@oss.tenstorrent.com>,
        Darshan Prajapati <darshan.prajapati@einfochips.com>,
        Guodong Xu <guodong@riscstar.com>, Michal Simek <michal.simek@amd.com>,
        Junhui Liu <junhui.liu@pigmoral.tech>,
        Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
        E Shattow <e@freeshell.de>, Icenowy Zheng <uwu@icenowy.me>,
        Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
        Hal Feng <hal.feng@starfivetech.com>,
        Ley Foon Tan <leyfoon.tan@starfivetech.com>,
        Michael Zhu <michael.zhu@starfivetech.com>
References: <20260402084019.440708-1-changhuang.liang@starfivetech.com>
 <20260402084019.440708-3-changhuang.liang@starfivetech.com>
 <20260407-unedited-overlying-f6df47c67bb8@spud>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260407-unedited-overlying-f6df47c67bb8@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EZn4hvmC c=1 sm=1 tr=0 ts=69ea0237 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=XYAwZIGsAAAA:8
 a=5mgP7XhCOcSXvvpaiZsA:9 a=QEXdDO2ut3YA:10 a=2twJjXCMuRUA:10
 a=dawVfQjAaf238kedN5IG:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: qnyuU5_Lags1n3-RXFvoKv1tXKVfrtT4
X-Proofpoint-ORIG-GUID: qnyuU5_Lags1n3-RXFvoKv1tXKVfrtT4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExMyBTYWx0ZWRfX9PhvRUi/IueE
 nemvWa7/4fzbkgU2qFESyqsw8Jr2b4qEiQqBve+csOj23dWe95x2M912ZFco4nnukd2h5UelPdx
 oLuUBwB2oLRNUsl/DtdD1R+M8HoHj/FG2FRyyKvqFTJ3RdSums89j7e+p1tBZv4sIWPi1GaChPj
 iIpq6+UhPORnKQ6OGNRifKsBQ4q5LQS+xCPFFnmNAkh0Xx5NB39p+VHflywS9hsIdGxtt8togRV
 FYK5jtn08U+ISzH43JrBMjBEsarlgv5ftejlyc1rg26+fEK1JnAizkEXDiRX6tPA7pj1qsWVze+
 HdrB/JykhDqnETdp0cB9tqI/AzjG0RcoHsgno90GSBZR+4fGUv+8dhOPGcSQ9W6CHr0B7GwnF8e
 PTi+gLIywZ+AobFAfyF8wVtPgVeL6T+XIsM2MSfomaWq+KIaHNPs/eLaJFU6nuS404+A7//Rf3B
 n6gUf9RUPHYc4yUprmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230113

On 4/7/26 17:56, Conor Dooley wrote:
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable

Applied, thanks
