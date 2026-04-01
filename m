Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A646C3E3C47
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 10:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775038614; cv=none; b=WWY6LTuUgoS6bzy4rOwJz6iOunIdt5kTJLEV/R7XBWc8ECZ41afQ0jxT+2DTB12h8Us0Oi1dKDdpqN0DP07CoslXVs411cN35LEeuqjgG2IzI8iz7q0cRm6iA5TrRUhvUcKUXSBnPrcx723TcH9t+gJnHqQJQONQV/7hdw7Xgyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775038614; c=relaxed/simple;
	bh=KBXycPxrmm22Jcm5v3U9Xn8DaZXKMm8JRTL98/PJbgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=USEshAXIXvSQyipL8qWL6vj+hRHmJG69+4BHGkqvTqwsypNwdsOjP455x2gkXBYFKrV4le7GtZt0oOk5OwbU7pClv9rigITsmE0XlbGd3WVUYcUhJuY1NvL73K1kbwAEQZV6aGFel1Te+1CBt9eLAFtfXv9RHRrhVSa7D+XGH74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hipIgZFA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fvk0hpCT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hipIgZFA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fvk0hpCT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6319AJ1j3174410
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 10:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5San9duOFtJ5qhLmPPDELhjDDBAg/h5x2dywfngs1QE=; b=hipIgZFA+kNbvTtp
	mZR1XbTWGlMZ0euMAQk4acIN7vwobre3/0c6Sa5kKI5ehDi41HCmS3hoiKqpO6mt
	XWqamUfc3JYvFpXiepWFO3Yy+t6NyYS2NAe0MAwUH8XaUa6RVkVvyeFk2wdgIlog
	S57pVJM7fZDN+BfNKBdeqQgpdCE5fXqKVBYNvrPLqjxwnMvbWrMHm93dlL12mt/b
	dpb0a/PgvUNlu53V4TqrC/tXwqFfLBAy5ZDwAQ45LezR8effIyFFLj15g+EE5GMP
	i7T7cjqV3vERqjVy54pfXgMTbFnNR0YZSHWdky7J60Q7J6cKswerj554cZ0GoFeU
	fxnMPw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d90gbga6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 10:16:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cfbd336c3eso255123285a.2
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 03:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775038612; x=1775643412; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5San9duOFtJ5qhLmPPDELhjDDBAg/h5x2dywfngs1QE=;
        b=Fvk0hpCTJFSGLq1t+9sJBWc4AJINgiUOOKLYzxO6lZfHrRJ+M7JW0LbjR27JtrTEyI
         U1lHEAFwLx58d0GsUg+HknOBikRAaBCzXTrlALQ3WcHcfrsxxkuImfpvmTs/s0nelp8B
         6yVGBncK6/JbwCUWeljzQOTwIlRd6nGyjCvHRqkO36Bxm/5ToQ+aTXcDuMEqlPF31Fx0
         ccR0/6k9mEOPbdWmFQUW8GHjFVoagEQwacOmhYJhpl26885C6Vmv1VV/Xoe5nxPFBDsP
         K8MtJJ6Qs0RneNBZL4S1xfg0vAfbMn5P9d1oUkwFRIDBjEOv96oX40T2NgcYBKWbAy15
         oh4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775038612; x=1775643412;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5San9duOFtJ5qhLmPPDELhjDDBAg/h5x2dywfngs1QE=;
        b=sqd+8lpX3hyEj7hdwk0GY3UaTw4wffeUuhBylvxPZBQGlCGQX9C+ExIaIMWeMPU6jn
         sYcNvrXEQ1PU1J6t/j2/VR8Dz7z1R3z2cAonezqiGG+Mb8wUa6D+h53VztxsfbJrv6OG
         zUWMIKItp4CIqYCXs7/rj95IJaB27OsqRphM/t2K95SFV2GzJSdyKGeiuiZ/bU90Nqg7
         vk9BgGJPW+QekSBPU9C55n52Ixrg/xjB1gLriIeswPqUoIE38G4eeHmOLaDP0pzfP8Xn
         o87QN6fgEDkj04GzGutVnFrKlaZiSmPeMFUzs8G56XuSYozgpFBwCZKoIi0dafo8eHpg
         N1DQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjmOxy0EtAMt56u25MVm3vL9D7XujURfPtB3iuhFW6weAIW6ZOW+jTL3jul3vuhZqn3TtzpNnmbYj0@vger.kernel.org
X-Gm-Message-State: AOJu0YwLwykdZjQ4cMECO3wI8Suf0tjSBpZOPEov7TrhlUwVPYWmM2gd
	BuirueOuNmuRatg/a+B+MeBCHMvQm0VTnSfIx0DnH+x8Jh4rrG/j5ify1CYxwAeUPsk/+Tc8MVp
	yzZdRol5RP0rnTLBIrO17mI4cnjcBXRehhZbjHk3ulKCxmvF2sQlbKYZnQaF9Hvrr
X-Gm-Gg: ATEYQzwbgaQSzosZ6rsCMDliHftTmCEskbhMFoUPGuKbv+HkRSE0aviTAAaTXeDex+G
	mXQve4X0wfScYr/IvAM3cbyrHtJIuc4SDJzvF7/OGF6b3/5Arvf/CmvGS9wYp3c0/Y+tmZK9n5M
	4GDzw8blIlOe0eXDZTC0ETbLvxGAHRCOQAj3fM4P0Zc41mvrqljF+Y4Mp+MH+w/8sOZOmxbRC3Y
	76bLzYvpbohRKtH5o73DAoFEuAOAQNa4OuTYUUBpk58jKDqXi02/RJZn7H1X41cQZrPfJI9bEOJ
	i37Wby0+Uevf5dAjSGTtqQq+euKZoIV9b/4xOoZawRWn3WN+oIlGWr/NtTkdgkaqB3mOzQnFg4m
	vskYklqmmoi2IsX4rNYJ9kuPXDBHcrZc17oPkxE9h9BpjBRn/i6kdQXnDoUpqD01e4WfQDWvAIg
	fZAjw=
X-Received: by 2002:a05:622a:11c8:b0:50b:2875:5782 with SMTP id d75a77b69052e-50d3bd372c7mr30208221cf.6.1775038611985;
        Wed, 01 Apr 2026 03:16:51 -0700 (PDT)
X-Received: by 2002:a05:622a:11c8:b0:50b:2875:5782 with SMTP id d75a77b69052e-50d3bd372c7mr30207981cf.6.1775038611558;
        Wed, 01 Apr 2026 03:16:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1ee612sm504969766b.53.2026.04.01.03.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 03:16:50 -0700 (PDT)
Message-ID: <f07b4d80-bb82-4ab9-afc9-ee06b48318a8@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 12:16:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/15] arm64: dts: qcom: sdm845-lg-common: Enable qups
 and their dma controllers
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
References: <20260331-judyln-dts-v7-0-87217b15fefb@postmarketos.org>
 <20260331-judyln-dts-v7-5-87217b15fefb@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-judyln-dts-v7-5-87217b15fefb@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5MyBTYWx0ZWRfX4yBJ9JjtQOwf
 vuAHjdkk/0ugAhJZFGT68B0UJpmIR3rB0cFPqTb6kNPLNiQVnDhGVo+FUHKKpDpJY0eDrRKl8EP
 q9Bfp2+ikKj+AQ9wSXgkSM3wPHU3Nw4wl7A9U5DPQwYdFsXOhXjsrcO3JNb9xhEotNvOlkOcXrs
 5y+o+HxCcdnr7m12AHMSv3oWwOjiMwzWcFI0YdNVYr2N5DXD57Y2PqQeNfu8oF4ZfW+Gbb/Npev
 u5RAFtkzrnlHMFHiAgnuaHb4HFEgDTGfSzfs+uU3/Sfdvpg7rYC7HkPStb8LCO+S3xeSbhFUTTq
 p2i0DqenbjfkVV9eU9dRkPBm6xWnE2835hnb3UBPogHo1/sWiBWf6Sn3FdbN6mhhBREB7iYaCy/
 KYzQuT/r3u9xs0KWrNGe84cpkWcd5nbwJQ86qwTLa79MTvyi/POiJzjKLtMvzYVQvqGUHyS087w
 EjAhdsK2rvlgMc3tTog==
X-Authority-Analysis: v=2.4 cv=QJJlhwLL c=1 sm=1 tr=0 ts=69ccf094 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=yndPCfnnJPvdZL5cpNsA:9 a=QEXdDO2ut3YA:10
 a=IQdlk4_VRkkA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: MKvF_1VUHYm6B9MrBE9ARnNAEAF_EpTA
X-Proofpoint-ORIG-GUID: MKvF_1VUHYm6B9MrBE9ARnNAEAF_EpTA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010093

On 4/1/26 5:15 AM, Paul Sajna wrote:
> Qualcomm serial communicators required for i2c, serial, and spi
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
