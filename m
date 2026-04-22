Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4170221F0C
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 14:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776867036; cv=none; b=M+uKAiW+VO6Ix+A3eZ3CXrOODawZa7t24xZBloXc5+OYfFCu0lzRQhCSJxpK23ncFfI3w+i5MIiU06HfZtez0tDhRRFc0MPnsmzM/Rgv+Ej5w0wN+XSGNaMATftQS6Pg7VQ8s1WZir7OHl0S6PkwOSIgtD7qo6Hhlm7n6PL8YMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776867036; c=relaxed/simple;
	bh=RpYjaPec1znN8luZVx9P1DlZtHJSoiNUyzaWHmQtS1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZuL9L55mVSwL7CPb17vGDFodEZwqbBXBs0b46jCLdZPJoOwe7Rb+no8dKzeYNHxgrl9l7I5kPczhlkJV3xk70JAs/ml/Gam6yuG3thWm4A7Mqv9/l0aJQ+9rKsUJNu1Cuu1BE3yVk9he2iy3eIHyjNv2ElyaFwBOKn8KR16+Ih4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NUqzcDcP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KDDEny6M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NUqzcDcP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KDDEny6M"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MATKrG976178
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 14:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1MQApk2TA4Kgh7BCHVEEKmfYFj4yHwg7EvzAss2naHg=; b=NUqzcDcPw8jga9gZ
	4tU+rB22SfcObJEAoSjEJS5RMxhI1sjE6EFy++ZVvQQcTVHkpk6VUS0wZ8MflJt+
	iWDR5o02Js5yadAzOHP0+1DlS7keQ9UG/ZqGLDu+g+4akJIn8WfxPUvQIld5ppNe
	8L3vAvsJzJ1BURQPm+r/n8qsfx6ACZk3KOIKm3SqfpioQHavkbzZ2hK255ErYvSH
	V9ssuqmozlW/qF9ff+N+SJm2yCWNWJV9XQVpySlpDwK8eLLQQsaF03ygJbzzZ1nO
	YKElWdS7zDngAeLxuNgthnJot+7EDL1GOh9KKXb5MvBgNPEjlbXOeBAHxZh3gn9x
	DjF51A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenebt6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 14:10:35 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so6603334eec.1
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 07:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776867034; x=1777471834; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1MQApk2TA4Kgh7BCHVEEKmfYFj4yHwg7EvzAss2naHg=;
        b=KDDEny6Myvj1SAgsZim85hx2Jv2vabFYaTeKyTV7UuhBfvS/omelMuWDvz2f/yHJI6
         CDUp3PFoULmeNxOXCDpoJ7dUVR87HclZ9qsOfd8gIFHx2+TVT9FceLaABrrhstW/k6LJ
         hAtl51M9e3t/BYl3HnBtajECougB/tCor6oTLYSmnygBiUrYn3HXlOya9VpqOTEm/vw8
         wq6Om4YhYne06rtQm7WjkbIzZ6YgP58ygmozjNa4JjI9X9Q/I076Lwu3EjCDw3zY6Eq/
         0Om4qz0M1obdH0OUXDcauLunqTfiQ4x/F0S9nHiNffMuVsoR0ATogw24q6vQ0ytk/jd5
         KxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776867034; x=1777471834;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1MQApk2TA4Kgh7BCHVEEKmfYFj4yHwg7EvzAss2naHg=;
        b=cC6696L92wXi87Oo1EK8wPvS/nsP6uy6yTonqrejsFdGFg1tGGMwA9ig2Ggv9fVkq6
         UfYdHgRHMxCetX2gH+k4CKZHg2F1j/8ehDLj/ObMyOewAN5Pcc1gABfG/qUg/v0Q4qu5
         cC4rLhgMyEj/aCUthV9R/9LKIfbzwy6CIapNGuPjJWyvsYOvapCRtt17hM+QB5u8RD/R
         dak8oRy1yH+doPFDlIzy+BEUfo2pfWqTfX7vf4KI13/IfWQ8nVOBAh6jyAgo+T7cDNZa
         4pVFmWLoTNZikKe0I+Grr8+V/hIjx68hEn+1IQxv20cDrL7/PcARqYXGvWuiQ528XEb+
         oiRA==
X-Forwarded-Encrypted: i=1; AFNElJ/2Jri9xGaJm2BZC9zjeXfrbnJ0k25Fq6zvK6sfNixkMyufEPakABsbV3UnuaIEyHSkfdXt90qVdnYX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Qtkt/jPkgzDIVCH6np9wiTCxc//NNzek0j249z9SuEu4ic0s
	aj9z54D82XN8Y3OrLdD5n0PkOXLLfcTIFcCZ9yTpTPEI7Wnn+vzqYi8VKNtwLfZDCHrwvuZ8GTj
	96LVKvFoNoNVwwKHYbThOpVLXoRfd7l4ByR0J3niux4EzBdrRcjvQ/xznCn1rNzFw
X-Gm-Gg: AeBDietxCHzEBJ+b9R/ixlx1xh66iadAgaImkR2nImWSVaKTk5PdWX0M5KaChahGwBB
	/KW7WjG9+/SeBH4AS0zZ0lK+RqXGXUZt9X4NEXOKDV19lgKxlNMHrnEcQYGzWANmmMXKU013K62
	p9XBxACkHHZR47At/snv06HAQeEBU7y9GfrFzGSbdduUs+m94vd3Mc/FoffLavvtinjF5olbtef
	wqu2vGG9up+OWymxiVGB3jZV+Yqksgtd2EDOLq51k+UWTlHp5s2wmgRkzTm/7ublRGVkuZr527k
	jrmFOKhLPEiv7HQ+G8iEIAOrjN3bXsJqxZyAlBF7j6R6au9jXLMMn1QlGPATeCqRbeQ0AEqwQZi
	5IE+FUh0MRpXdosUQNysTlYWtm+x8RgKwfgdKbcNcKDarUrm7vR76+7Zux3DRGEmxEgU+bRT2Jj
	MO8uYZ91Zff9fUYsUI
X-Received: by 2002:a05:7301:f90:b0:2ea:7901:8d72 with SMTP id 5a478bee46e88-2ea79019c06mr2915519eec.17.1776867034126;
        Wed, 22 Apr 2026 07:10:34 -0700 (PDT)
X-Received: by 2002:a05:7301:f90:b0:2ea:7901:8d72 with SMTP id 5a478bee46e88-2ea79019c06mr2915485eec.17.1776867033456;
        Wed, 22 Apr 2026 07:10:33 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa244csm22601241eec.2.2026.04.22.07.10.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 07:10:32 -0700 (PDT)
Message-ID: <58edec29-831d-44d1-b574-4dec8985ac2b@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 07:10:31 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/6] dt-bindings: remoteproc: qcom: document hexagon
 based WCSS secure PIL
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260326043320.2507890-3-varadarajan.narayanan@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260326043320.2507890-3-varadarajan.narayanan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEzNiBTYWx0ZWRfX0gBB1Jb8GeyV
 LeJl5DrThABGasW7u5loC5hgc/hnARDoV3ZsNAGrUHgR1WU85gP+U5b18jK7wKfkZ1b5fIHaBhA
 /sH4XgTSfvYsYg3s0yE7Cgw/fowaus/wvnlMSEG8hTzaQdwmXaanqVwXnDM6mQfzQnmExb3Zhu2
 /bqd0z9rwNsHiX47LgnB7ry5X59aGMI16b2h3mZhL+equyaaZx59zMZnPg7ZGCtH+YQYXaUtTna
 S4eKnGTuKRphmhIhS99Azw9olLizln5KMiVGnxZ+n+ud3ucBLEDkDJYjsLXf5M/J7PoNPFN8hNS
 jwyP8BHcOuR+Cm3zEtCR64GDgLLDWkeQGs/L+C2XdGVV3n2o23rJ313D7Np1jHPI+Tb9yq7K5xe
 aLpXVgZD5ps6SRHSwUlyldK9O8x2ey+eKhLgoyQrT0J71Su9mTDMQgBJbBzfToptcJX3Fw0L+Yp
 wZpY1frSp6kMtuB62Qw==
X-Proofpoint-GUID: upnV0GpwZFwkG6qcKbERLa08ZKx1Trmm
X-Proofpoint-ORIG-GUID: upnV0GpwZFwkG6qcKbERLa08ZKx1Trmm
X-Authority-Analysis: v=2.4 cv=RoT16imK c=1 sm=1 tr=0 ts=69e8d6db cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=K7Ul_5t053zlMiIs22UA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220136

On 3/25/2026 9:33 PM, Varadarajan Narayanan wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
...
> +maintainers:
> +  - Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

given that quic_*@quicinc.com mailboxes are being decommissioned, should this
be changed to either an oss.qualcomm.com or qti.qualcomm.com address?

/jeff

