Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C9149D582
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818574; cv=none; b=SiYDazpC3Bpt2HXx528JpddxfwkRsQ0jGmVt4ZCWSbNtCOiiWXgObRgQZTUcOPmBv9e3jyCyVXcrahaV1QFzgSDgcbHRI5O2r3Lmq26ohJKRUeueoTV2MV0JRekGY74h3FyyAlBbv4ItQR+s1PKRsYGjArPRCN966K2FjHF44+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818574; c=relaxed/simple;
	bh=xRoJhJ1AvQpHt61hi2ZYmyap1RubXShFWJ+UOKcfqj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e7FoDN+9+MWuqr1jZ4l13e/BSSmwKg8yP6gQa2zO0C+JVJ+WL/caA2idVP7GcyO3nGEFVfmryNyZiW+sJmQO9cGlDtEcQs5kiu6jj/A/6CYRZ17EZRFoWoyF5JLPIxjSJyQHXEOhIWXFUOxKJ2iM5aaO3ttVi36MkijOArIEh8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cN5AVNxT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rm5Wo64U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cN5AVNxT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rm5Wo64U"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC01mm800982
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n5VagN2mi3Fe/oMevwo3rCpI6oJ8tUsL3jWLuRR0zfs=; b=cN5AVNxTwQKcA6s3
	ODYh3wrV48eb39bXu8iJPnOLRG3DoeqWvcSFgBi7KyGIzd97ld9bl/OZakKbDYKo
	dQSuEOgw2wQNquL7jFNv/xM+qFNzEkrsb+qwWrdScB+oDHgKPKx+X8lRl1YvjTdk
	sd+GgY/LJIKbJwINTqOpY2HcqeLxR5624TN89CLnIz6nYwAmwtAOw8Vf6PECHznK
	kbIXAlCNATGN+PYezZXMK8MRi06wkY+KwSxxjr2Xe8Mf6pQPqL9MIkXHdmmjcpSl
	80b3g/OzrWbDqC1nZTWs0WB5Bk+fZdgIulJ1nMpF/NAOnuD5PwFtJvChbVoEqLrs
	5Fhnww==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfcscwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:22:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso27507985a.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818571; x=1792423371; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n5VagN2mi3Fe/oMevwo3rCpI6oJ8tUsL3jWLuRR0zfs=;
        b=Rm5Wo64UyT+I2Lmb++D2ZfzTNGrgB9THvi8942kAoO9f6GnFIwvHhQh2w61yMrQH64
         H6wExKmxuua7hLPWKr3v/LYMzZKk+XU8Lu0vNN9XwSM5NQmZavSNxoqjbNQ4BA9zkgHN
         Hxn4/eoLl8e6CZoTAKSGqMhLDdLbBj3qqT+sUxdnT+mZOLuJQ++fO1T25SiTvBOCErLl
         mOzLj7p7edGsNQZpiZ0Mk4dEr5hfQrPF8f54/NfVcvsgytOQkhwKCgH+2u6jBH8CF7/t
         VLf21YG6urWYSPmJqXbnbaqPem4l8zG3dOedSpN0trDYnCtyzx7oJj145jcuide9EcJq
         N5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818571; x=1792423371;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n5VagN2mi3Fe/oMevwo3rCpI6oJ8tUsL3jWLuRR0zfs=;
        b=ttQpk5VSfBQAWErCgbjvfHZVJrFX/Gqlspcnmt9yPYQoV8ClEUKIWm4G0bnvNS4UJC
         U0z9C11HPWbebLIbpsVZAv9YlGfA33rkmIOklkktcGLpLY3yMOsepFXYSaXWXF1MCbG3
         JA16Ec9GiMI9sExEKVwHUcDItZnY3xRZwas2MLI77zCOs+qUa7tHoJrsalyxLwYf0sWR
         EwcW9uEqtfkGhv/ORgN2HFrvX0YEsC09ZPLvtvOs44wq4q3jEwZau6uWKmJAhBj6njaN
         Au9aPwbQtE99z6FLaDBfQJTzoQJLnfNy8J8V6W1TqPOT17uOVzBL5IU1f36/0VuOeANM
         j2Pg==
X-Forwarded-Encrypted: i=1; AKwUvBwUFW44MvQxyEwIFfScaIhEdSzzSTw0iA7LdO1BkU773IzasaZotGPOEAw2ULjLvmnDpO+BOQcex/X1@vger.kernel.org
X-Gm-Message-State: AFq9FYJOtqTEeQU9mM2K1+fM34usNhXlbfiJ3B5AjrWl/5z0pw1mXtEA
	E4xCVlSOZpnrenvnGbfiLatdOx0eICM05PMK+njAcB2qyIfOjw6jbqGCX6RbosbFqwIJu+wdoNu
	JbXaAyCfzytu8DTjhGPS5R9DCkpNn/htAlGRGSjnKnmzHF4kyegupG4BQpt6khYAT
X-Gm-Gg: AYBFou1gpZnsQFKJlj+IJdjDdMQ9pN5LktWJCj/JFRcBFXqyJk/0w7LNzsMpZCgZJay
	xUeZwjvZAFRwHZGG3ktZnjZd6Ol8mRPcdrBBLlycjLuJ1colHSL47noQpk3GAMlAyxWtgjNzlTP
	ngUuvdvdY6O27bcIbEHu2TFsozJQyz4HR4qgveGHS8Ozm7UtID586Md0AbMuwMhPeR+1SrasM6L
	ogeUyFbRfQQENb91IWMI+BIuw6WGuMLsCkVlpM5jiwff3BCY0S7FWefpKpoZg+8dToSEO8rWqBt
	JxwKcK7wfyTmKyCBZ/WNs5gufRtlLFz9SbdYhTkmB4wi5YRwb5MBbEifNMjf+zbG2RlVbdlLr3e
	/b4Bfqmdj0WRpRPoKGxXB4g==
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr1893174185a.4.1791818571077;
        Mon, 12 Oct 2026 08:22:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr1893167285a.4.1791818570443;
        Mon, 12 Oct 2026 08:22:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd3597sm5300210a12.14.2026.10.12.08.22.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:22:49 -0700 (PDT)
Message-ID: <b156e0a3-f66d-4016-9d23-bf6c06e9c7f2@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:22:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/38] arm: dts: qcom: apq8026: Add space between
 OR-operator
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <4f490edf747de9157a86eb3b3db634e2b6f6cc39.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4f490edf747de9157a86eb3b3db634e2b6f6cc39.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kaFP6vQO5oz2SlO2ZIrgEkbg01trIPpr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX6nrCvRNd/3CR
 K1S8j3nvmjtLoZegS+uJeqDZPSnwWliowjaPyeTF5sRR8oFCF5ckKv98tbr5jy7bz/RKqsYkSB9
 yFXvtasUzYq6/Ppp+EKAQy6NPB49XzU=
X-Proofpoint-ORIG-GUID: kaFP6vQO5oz2SlO2ZIrgEkbg01trIPpr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX8Unqc8EEh4L6
 hvU1SPWMZ4t8B87mv+BiIrFFh1L+HuMBZI7iJ2OT3ecmNJOeAjI9mjCqvY7mwupBAtGcZKmzmnP
 6k1VspgpKBAfMunP4tgV9vchc/tnOJKfpZAP/W9UBYH+sdhjzymjZTsIXmt/J/pZHY8nqy+5ZMH
 TdAWL4aehaEnGfTwde/prawv2B68u1bVjdtHBGDndAW/TYeuSaRm79iFDY5t43I4gUOUakMimBW
 t+eJ4OJdYWiPucW3cWJrxm/tnWZpqN5WoyMRi7TkWtRAF9pJX/vT1rH0nac5QB1wR2zSoZx0Rr5
 lhpArqkL+gSHF4cSKoLyAbsQRExU/80BFicKxZL3KEyq4R2RlVbGWBBdO6WIUG/+mWLNHwUq0Yh
 XpCgpsTpJCiCG7RVvGf9hCv3SiOyiVBdpVdWPG95G5i1dbTAOR1/lMxdnsv9oVZ8m0zhTUCAiSZ
 ebpQBBJdrRZuBDzXBxQ==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6accfb4c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=Ae01CA2AY_RmMo-c5YcA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There should be a space between binary operators. Found/fixed with
> dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
