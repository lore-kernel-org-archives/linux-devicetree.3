Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3539B5013AD
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 12:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982357; cv=none; b=SyDW6P5g0Ul69b6CfAKfXgHnDxsyxdFa39M4NuTw3sk5uXONe6U7D9DQ84D/y5v9KVNgDSMb4Mw+QF/3Pv1u1uwhkPfE5/oC4+/ZrQaOyGSNkmRbHP+27ZdzaD0vcH43upgZwkj9G3cYvpbp2jp3vm1vpDEYgUnR59lqJyhMsfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982357; c=relaxed/simple;
	bh=ggIJpFtBbGEOkh9+LAMjApcVH5QDsNsEeUnjHDyW24M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=faXVpr3meUq5RVEQ++cEl4i9qb3H9bT7tZf0w7W7gRM9Zr15UaUiAnXaNkzhp0EKGMNWahAbki2zs4DVPHPPmHUlhlx43cEUh6Dw1gCIYfBNlU7KckkYZeC5mjRN2D+r89nwSB4uEmb7nGajC1MATnVBtDBN02bDroQlwBIPHQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIHBFsNf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UeTOiMRw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIHBFsNf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UeTOiMRw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBIGgG3365999
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 12:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YoL13luJ5wOMcRgov2oFovA2g24ZYuiHZYrEI39rqsU=; b=ZIHBFsNfWR+rgZZE
	SSS/paEcFVjnSHJFVuKa8I4UXs44sJTgB/RoqL8DlGwmm/3R/PjrZm2Kr5ojHrti
	dWUBexYRKSW/kx7YPFoCa2m2IW3FVJR+dJ4QSAe8azX6xXO689NTWwqYgFtoQcDH
	MrbSJ5KEsHBtONGueI5V1QeIOMGtwLB72NzsaI/gZo4ttjNkY0beCTZjmAwQ27Tq
	LHKuTX7h1vFsU19joWqcF5jCTDzKKjE0flanw7LgAE0SOPvZ9cvqwz/LuPObKxkz
	UHpChVQir3idXbuTCmyIpD50LhPVlY7JjjTVzzshL3JfBuZqPhFEwbaRQs0pxQWW
	5A3D9A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4621mv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 12:51:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e661ce1dcso53302685a.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 05:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791982313; x=1792587113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YoL13luJ5wOMcRgov2oFovA2g24ZYuiHZYrEI39rqsU=;
        b=UeTOiMRw04F41y0j5j8d8OI2BXRyc/sUXMYpV7PjhJ/GiU5JIeNqoFkMJZtr/yGxM5
         xFNL4tDf0gwn78nsOmUyHWP65NPbrPXIXeDts+eeCp09zDYl6Y58BS4D5ExMdYeZ43iC
         CURFEcKQdsgwJ93+Id17cPex5EmVpUX0fJynTivSxhpjVI7+T8QSX8zD1OcZM5Sgyucb
         0EAmkNu0S8/lHcvwcmqWpi2iOI8HLbMn37D3+PRFfdYaOm1p05BfyWAShxElImqAzHgq
         RI1hfvksMQ91EYh3H3KSram+CBC7zGeHWqrRg4pybYmbsiK0VjhCqFJcJG0h12P9sqBC
         bmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982313; x=1792587113;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YoL13luJ5wOMcRgov2oFovA2g24ZYuiHZYrEI39rqsU=;
        b=zZ0P0Dyqoxp1hG/oqK7RhG4dJVSrEmVbHiFl5DXgpVD4htebPcAeBLA5lBrRZkF45D
         Jc0mLIkeZ065GQ70CyNwmWQeztdWSetk3bLaxBjUvBJiAwC+LUC5OsIM2O4G3osMnL4q
         riYJhCKaWPTdjZFzHliqQ7tZxFuMzYmaAriIJ5aEOw3lbl79PQuOkjS8zSvnQkBRwyqc
         jmq/6XV08X20L4ZCz0m1UvNrtzLxhoPyNnXJonW/G03f96IR68i0jm6lYP7TkDdeR89/
         1c4FU+1hNBzAucC2L5fDLrKw3NWDyawcANl07kKiDGgAsDzVwdSULys+KB7Xwx0UQRTW
         QqZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEq7R9Q4wV6aptQirnCkz3G/7goya1EUI+OmXWv4zLHC+QLqKWqB1JdEFzgGwe0oVsFnlYbQiLoBUS@vger.kernel.org
X-Gm-Message-State: AFq9FYKcYr2Ke2EJ+E251skAGKzB4F5YENE9GCtEJydEqo6luFwc65Jl
	kveStyxiUc784b3qrsgA5RP6Bm79fykSMwT1VoPuAmjOtDXWOGpUNOEkFvszUd342Uq0RQhFlPp
	hdN+ds8nMpby6rIgylpfw33AIxQVBJNZeel0WG1iNnJrAel2CE+YHzoAHDty6qcjh
X-Gm-Gg: AYBFou3yiaHpSlCcPiP4uc1k/Q5mVBZ5L3sZDyp6MDsIl6ccDiCKNG5+LoS3iJvKD/J
	sADcg6EhOxwKfHmDAY8cEz8ImYQ71XFGftnLsPonK8YMEYiviyuJ2DYB18mDXJCy6YcL9YaIkbL
	0/zJV4QuGdzX3F+m9zmXb98ZvTh1nTV9a8CpRO+nTlyU6BdNJxrNU6+WnhySZxdlvvILf2DHdeq
	9BRyOzCZjoaeS68gjM/ICEGj+Uet6j6TDzMT/Pzb1qM4H4E8TERigMwCy+GcrFFBVDmtP1oXure
	syYIgJAlHTdyDi3+F4LcCf+V5+MnY7gKvXxNqUJEDHdIGAdS5TYdUC25Z6qa5Xnd9mOH8i3L2X0
	Owpiw8IwYlcpzP2t6XBV7DA==
X-Received: by 2002:a05:620a:29d4:b0:93f:977:5d9 with SMTP id af79cd13be357-93f097721f3mr132808785a.0.1791982313191;
        Wed, 14 Oct 2026 05:51:53 -0700 (PDT)
X-Received: by 2002:a05:620a:29d4:b0:93f:977:5d9 with SMTP id af79cd13be357-93f097721f3mr132805185a.0.1791982312668;
        Wed, 14 Oct 2026 05:51:52 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203839764sm1094637a12.7.2026.10.14.05.51.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 05:51:51 -0700 (PDT)
Message-ID: <292be478-dd1b-4ad3-a5af-5df6e61bb89c@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:51:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sm7325-xiaomi-taoyao: switch to
 device-specific pmic-glink compatible
To: Stanislav Zaikin <zstaseg@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20261005164303.1208127-1-zstaseg@gmail.com>
 <20261005164303.1208127-4-zstaseg@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005164303.1208127-4-zstaseg@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HW1IkGzUCj56yxAGJbUKdsafXNEPRO_I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfXxvlzcHA1SHtD
 4MgHkMOEMt1uHbFTOgBAdCHyn4UOHTOjVEjk0uRaTgj/eVzkL7A8wDVw6NFrV7+jVEHtMzBmKHO
 D/FLgbVLdDgv0HCP//PqWatRSNH2c76yViucz5pKaQv5unPM83g4LpwvXgJr74C+ZTQ6PnoxenS
 ljw0twxWLHKS6D86vRF3MlHaBN1GRY8wh1PkkFFVPcK2GZMka1yeisTPpIatM5IECSj7aSpAeED
 vqYaSQP/Nze+S1d86klmYI7wqa+4Y5O541n7H5/vrH0j6dNWSNXWKcyO69DFvunQomuECuIz1zh
 rPTP5hICF3dXF/jtN/tl3hkigxKY7G4rz//u6U77ynRMqbN12iVt4sAn4r/6E7osXDnNNgKlB/x
 8PkrgY6pJzh7VwRkR1OUsNzrtB8qdfwDRfmujNUwdNw1AuS7A+37uExTJftJkXUFu+TUME6k2A4
 gmynUHovp/rRMqD1J+Q==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acf7ae9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=EvRZl4TTolMPfV8XnZwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX7YfgVxbzZYrQ
 UZFgJ07ZnSL0GTcUE+BelGXj9ngyIUfxzZ1tfNEhEA9TeFkhpFjocXGhRm1Bqz+pZdHsLbdXCB8
 2rxTfmqxrlWg40UrMtrkdfA46t50GIg=
X-Proofpoint-GUID: HW1IkGzUCj56yxAGJbUKdsafXNEPRO_I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140051

On 10/5/26 6:43 PM, Stanislav Zaikin wrote:
> Switch taoyao to "xiaomi,taoyao-pmic-glink" compatible so
> qcom_battmgr can identify the device and apply its taoyao-specific
> battery property mapping, required because its firmware shifts
> battery property IDs relative to the generic sm7325-pmic-glink
> firmware.
> 
> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
