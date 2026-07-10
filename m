Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6360741227D
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783687797; cv=none; b=oCU802e9fkJXUC7YFNhSzmXEdikmB0pgIREaaPIiHd7RF7vfNSxlQHdI9rdH0hwSbwOkULe5BbiAhxepBa7TMKiUqSyFAGzDyFAIS1nQG79jOy6id35sUcOvyNH8xO85Rppw/IWfrnDwb4EuE+1+WFMAkaPaUphkVVydm0mKuWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783687797; c=relaxed/simple;
	bh=RG0E+KFAXR9/k36QJ15dquXIxc3TMdESPF06VF9BXjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FR0PvPd6Uv4XX2/SjiiHLG3JALZDDdas07d2GCt1bExp8ZGX2/cdUw2UU5UX2GU48TRfBnkCluMCPvLW1vOUjY+uS8vVTLach01fIUx8vYVxUwBDXXt5NjFutpUuaviA2WWOOR1xrfpJc9yXsn7Ya6HKY1JwFipGT/pg4Xk8qBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M9lTDv+N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NWdS0bFF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M9lTDv+N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NWdS0bFF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAmU31605080
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9R+TcxjPA1gIS9TbqszDxvbEKtX0IcNJJBmSKq1CI/k=; b=M9lTDv+NZRFB0mbs
	cMmxsaOpcQ/WfHp7H3iOEu0MCDaeFCWV2xVjE4h7ZyjQzu5oWl0JA/l9wkj1Egme
	NN6IYlSjzsSr40mfxYO+AVS3OzaisNWbzvI4ROowN4kT3Ff/rQtLsKi8xnnYChZk
	ZmuT4WWoRiorbV0FLE+RLM0FsMsqANw3bumLB9w8LwPnIaoCbInkiit3v9dSj24q
	Lr259v1E+lYvmnDbt0BzFKACKgzTQ+7xaoEtga3oK8Te1JJEXH/BEtfWun/RCeNK
	ce06qGg4k47CUHcwtQgQJpNkYmlmt9T14fFhHTnLjElwyGU4dEiegpvYIDLPmrWL
	+wBjxQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fanweah3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:49:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfa45b280so2521071cf.3
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 05:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783687795; x=1784292595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9R+TcxjPA1gIS9TbqszDxvbEKtX0IcNJJBmSKq1CI/k=;
        b=NWdS0bFFaNCNLMaSM6jon36TGjKmVD+0sB2em6r5EG+4/vC491TmlQVQgGXWJRxvfa
         uKBbXP+lCPwjyWEoddlGrOMva6pRMswCDqOzyaZHtPQy4Z/M7Kv4oIB4wp58+l4M24nZ
         yP6+V9Fs/v1COMHvXM37ekSAJrDxfq9EXUUFWNrTyoMTMp8XzQrAlrqWqeRuxSRJItbu
         B/E3aDPqhaMK7hY1Lm6IPY0E1FwNwSc5NGsavOztyJKA6TPVJUX8GcHVhpIKyPvmMx/0
         uswhHy/PTq6rROGjpKSTa+XqHo3dO0AvNsDSwyJOoqtI+QgGLaB93D4Ar6C4M/gi5iJy
         Oqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783687795; x=1784292595;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9R+TcxjPA1gIS9TbqszDxvbEKtX0IcNJJBmSKq1CI/k=;
        b=Bxy9FSD26bzKWSWMfkG8Jka4deKnkQXEZB0sbosFBRV887hynvO9uH/SlB+VTumE98
         BQvqJCT13+Q8c/XYIgUHz1nY/cHLkC7PCmYDC3DR2HU6qjIpRGifjcLLJo7jR6OUQgBs
         jHfUuYPvxcEwUvI0dMVqimg6D5YB/mZqGVxUL9djoDmKZvhuvGIyOAtCjogALE75X+gR
         Ttn+97pGJFwFh5eZf1bO0SS1xjayCFAAdaXSd75cAMZAqOH1Xy3y9MhbRGE1YxVk+ogg
         RZQ3bHkC/k6jEc5XV+IdbP56oJQG595Qf45LIaKs86cFx79hRdcxAgqmmsGZsHneKDdE
         37fQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr9NT+cGQvxg2bSQ0LiwA4yTsLBpCQEO6OQSmW1OM0SICaYEKokkxH3gf5AnbQ5Lk2HKPvWCmgnFZUG@vger.kernel.org
X-Gm-Message-State: AOJu0YxILjd4scyLgB2Ka0WK7vNwcl66rrpCvvxcY2GOMV07W8/C8m5x
	Hkdrao/+q7DvW2nKvkOfjEmTzv7u2Be46icuUdLUFblKh1uDQHJU8K1LjEvZbJX93JKEyQHflco
	s/Z7CjxNoEzZrRaAMj0126vd8sRG27GwJdfL6HzVWLto5yv1RsJsPTK0RaedlWl6R
X-Gm-Gg: AfdE7ckEfUjCKtoMgj65ovHC9Njyt2kSVkMypYtolb/hLu0B5NnqnTVp4y4/g9idBr+
	D0W9oCRtAZh/SyzcNWxI53UJtd4I6anlpMqSt2+WAhdBx8C+7q37miX2UtKbsbFkzl2QcPYbpnD
	0kCnGUp1MMDJrf9be90uH8UXzcoNMF4CALBQXAcKfG+et48BXT8HegX3Vooz0ZKyG6n3ft9l1j9
	aCiAD3nAQ86Rq2pNON6pXIzZ/fK50Z+kJc/SwyS3N4bCf50cOgD5OzICDU1PGRwB7EkSSdCr+p/
	A7uEthE2mlLehkU7ymju5kwvtwKEvUeOWJexSXEJhJOvHY5d9kOCCSdVQSefKmuUBJP53vkx8u+
	9deXWsExMuBq92iwNQvp1EDSJq0eO1cCNrdI=
X-Received: by 2002:ac8:7d90:0:b0:51b:ff1a:3d80 with SMTP id d75a77b69052e-51c8b4e389emr96166281cf.7.1783687794627;
        Fri, 10 Jul 2026 05:49:54 -0700 (PDT)
X-Received: by 2002:ac8:7d90:0:b0:51b:ff1a:3d80 with SMTP id d75a77b69052e-51c8b4e389emr96163801cf.7.1783687789431;
        Fri, 10 Jul 2026 05:49:49 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d79906sm11404547a12.14.2026.07.10.05.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 05:49:47 -0700 (PDT)
Message-ID: <c8d7b622-b36b-4ae9-b3ab-461ce87ac727@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 14:49:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: monaco: Add monaco-ac EVK board
To: Umang Chheda <umang.chheda@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
References: <20260626111301.3479559-1-umang.chheda@oss.qualcomm.com>
 <20260626111301.3479559-3-umang.chheda@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626111301.3479559-3-umang.chheda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a50ea73 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Up8ihbNnXovRR20EyoMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyNiBTYWx0ZWRfX6YsTplp6PQkw
 rJNJ+mKn1S3G13EVx2rXfgNSL1sJESK9yqY89iGNqd3ey0u5EVroDgBCmjAl8u/7ErUS/LDu3FM
 F3YKdHUbDIXUKVE2m3AjnnhnJn0rYK3Z0y6KhhwOkyJJ1S/uhHqT1dNf6VwvquTeZ7W6qr2kMzh
 YtZAssk0YmX6/85Cq4WpXSUrlHDQG/GPYT7fhKCU0zLErnoOFz5VKu6VEz7dNR7qBDnIJhojp+U
 4ZifBuWjcJmrDRPWUf5jh0QeFsiKOSGkSwZI/7fpO1+lzI0tb8YeyvM3crqbHOO8FD4fPx+GZS4
 /mfXBu+rVPT6PcmTSMUP4DYVvZSpoyzIJuxWCzbmoNRJRuK+ItErv7eIt94uBtSoit2wQwuF5Uf
 KRfXOqOe0xD+0lA2XU5AGLR7FnO3ZomW3Uw4oKU7jOj5awUsKlsaYqTacCmKQuwxACWkmMiHRkt
 kCqFCnqJCLML0Qaz12g==
X-Proofpoint-ORIG-GUID: 1KAAVg2LZ0cZKP7ex8bUvaKkhx_cK0Xp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyNiBTYWx0ZWRfXzphLTdE/XK9V
 Ye24wMReevpsuNycCYgnechC9WP6k5HInwaxja3moHG2RZzyKhuls9a9Zk6RY7iU+LnDH32Jj9I
 KOumtlfi0talHBqQJAFq+A1to9h0tCU=
X-Proofpoint-GUID: 1KAAVg2LZ0cZKP7ex8bUvaKkhx_cK0Xp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100126

On 6/26/26 1:13 PM, Umang Chheda wrote:
> Add initial device tree support for monaco-ac EVK board,
> based on Qualcomm's monaco-ac (QCS8300-AC) variant SoC.

[...]


> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +		vreg_s4a: smps4 {

nit: Ideally there would be a \n above here, but otherwise this
is identical to the existing evk dt.. I would prefer if that was
a common file but if others prefer not to..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
