Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794302174;
	b=QRu+jHva0MlS94/Qbqe7u7ufsk9tM8SkraB7/a7LhdvryO0mdMSHP/4mP/QfMkamnd/d
	 zEr7U/tJeQVQjph6pUeGujWfvWncFLoDZ9GudonIyIl/eMntmipnxNfWpJHL5X3yN3587
	 WWwIjNW+Ll5eAFk10P/1xGcwt48n5jUUdPg+E7htjo1NfhhnBkcInt9rDbTCCD6kAuQYs
	 hk2Aies/dmEva1SwiV+9V0xc5wmgrKm5pADUVywewDvr43QeHc5NK6yUFNGyUQgydFGz+
	 pI8tmLdC7A/RmoPK7js/N1zUU6+0/S8Wn7MnAHiB2jks7xXeJC/naze05f3kjXCphQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302174;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YhifgSsU2O/LcZReDpY+gRcZRboLCDLzviDtAT1ap0U=;
	b=LfbaGm/2dBjVePPA0YA8BnTWj0sHlKmxr/AJPF6A5Sdv+kQQ42+tEWLwz/o9GzSRe1E3
	 olMO3r53bR8B1jbVmh4Bfbeda3PuEvUyJ5HmSG8rZHF/+Mz93QvZRb4QOu/Us+NjuVW6J
	 w342rPMrdsfoUVA4ufHTLOvsX7u6MmKVDVYszeQ+3Cdh+j9g47IcUhTBTG/3Xyn8u859k
	 yJLx3Ja5qSQJyl5gZiJ4ZyfpxtA2uwBUkf05e91v7ayLqmI1JZdYAjLp9AhjeYU8JlrLP
	 BAkKBMNxPzzVPxMEFcuzYUK6WhD0tui1PIKuNutghdRUYtcpHLUaOpEejCinacONXtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M1xZXcZk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VPgoMVHe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260C7606A332
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 09:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 260C7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M1xZXcZk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VPgoMVHe
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA8WCH62833760
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 09:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YhifgSsU2O/LcZReDpY+gRcZRboLCDLzviDtAT1ap0U=; b=M1xZXcZkHdP5kZRa
	S7BjIj09qSnLZ6/gl4fhESylDLOZgqgobSQb83wNpE6n9kYhv3shZxrQ8MH4/VyN
	l2g5F3mkbnwqKn7d45aCWZ4F5np+d2PdCETTR3OvyqL5Fh31fZfwAP2Uif4/j8Ff
	BT9S9kVCMwqsU0py68A33cdwQWwE26w5joeXhv4JKYv9tSxe9Uzbr2qBZeCPpdsq
	hOxgahLFzUhm+kOX2Ydh4am5OULhrpF0ojIhZo6VnN7wQwDjgLqA7bKAelN/AHjO
	YJX3iF8iOR6dwEbAGWsf3e5fnqKcYQHxLIY5Dftt8Os2KKL2aYAWL2WwjgMdXkfS
	8KFVrA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufr608-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 09:16:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91eb05c8241so33694106d6.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 01:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794302172; x=1794906972; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YhifgSsU2O/LcZReDpY+gRcZRboLCDLzviDtAT1ap0U=;
        b=VPgoMVHe0tYN12oRa/KuAaocdtVbOjLTamwzxlhCyx+oMKmX4c42ahsw3vaa3fyQ6O
         sLMamX2RawLejZm1Da0Wis2qDEWQyGWlnOHzRXnECxyZQJhA/VxOMQ64kiS4zZzA6/qI
         NQVHFfSjBsPjDXVEuREh28jUH8fQ5/APUDjQHv1/BRpGh0DRnqu0lFRDN05VwsNa/NUg
         3maEtDg53YAYyORvX1J8DLD8dRpg1mLMASsu6c3G6pbayBTcyGTvIbmgTmOvOQt2oroP
         gm0DTPhE4XPGtXfyUuyY1NIESyT1W+vKDqnooQEUJ8yx1MQL4taBmEUgZ2yZ5xh8QGO2
         nT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302172; x=1794906972;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YhifgSsU2O/LcZReDpY+gRcZRboLCDLzviDtAT1ap0U=;
        b=S1v8ynCz/ejZ9pjynxcHIqxwTnGLSbD0mHexFcZIoiwHBLV2EJSECnBgVo2R2xqF3q
         mHhW5LhthBkvWDiGg2IkCorDyEB/XkhcemPuojlMP+4/fXsJOCxHeNCqW5FKfK1I+z1+
         24bRiE1kFGHyKwDPT/BMmwxIwmCBhuLgDGBGDYcisyvnvimibl5WqDwTODSnIWaLO50p
         lKNXEzEbZGBwC1JRLy6VBRNl0itZGoh9YOJfLdfM3kUAVAjRlCRqRwZvIimvf4kUD1XB
         BtRxtld6Pus1APpJmXvdhceiUtUQjlBd6ZKG1Q8JvlSmUgLGyjSncptxIN8mQJTKSXrO
         Ds3A==
X-Forwarded-Encrypted: i=1; AL+hErF9yQLfsAwORjKSO/CJCA+koRTpyr7zMQqm4dbw52dUxS1aJlENwIzUGmR5iJ5pSnpJapRr4IXcj+mw@vger.kernel.org
X-Gm-Message-State: APuU4Z84dDOVas7TXePqgg/tGsrGEud9f4H2R3cac80MCII2tBp4gQxk
	gmBG8R6AEI43svO1lHU1ISj1sLGjMUm3AwCPo/b/EIXvDj0cRW/+IXKFzcfLpfFB+p38gADTwgM
	xR6PSUvN+k+F+pmFO5WY/YpWqqccA53RXnqQZGuwBh7pUObxq0k4/i1MgGnxbKNFm
X-Gm-Gg: AYBFou34NOhCAJUFsr25hEqdOw9RaB9/KH5ZtNbUEtdLgwAAKhRnzQrTfzrZv3WzaS5
	xpY/PrVeTr3bJPqUAt0dfR9jEzc7BqqvPeht0pHR0NF16ua6TGUAIbXEyo4pe8pYXVRJEx3fFzE
	4VZew+jbvGvK6zTqgYrfoia7SMhLmAYFhtMgGPZjYC1DonG10vmRYgTWWBuFtLptbrc6lOq1BLj
	Wu4LgykSVD9DiuNnlPhPuq2Ru6TDlMbj+uyWZlTEXSHqw2M0w8SR55WICW5sELa4HXxm3HvflPt
	oJGwW3VMvXMuZwCgKbm2RRnZEVAdz6NyhVAOcZIqJhljduBZqmpeHsTAypec857md8fDpFUJGue
	DosmqgXWEbwZhJSRi2QfYHkVgKtXlhq8Ffc1odGqQBiMsRa7LkmEJQnTaWkdMlA9r4EjuRiFXiN
	8D
X-Received: by 2002:a05:620a:372b:b0:93e:4e1e:aafc with SMTP id af79cd13be357-9479f34050fmr319498885a.36.1794302172352;
        Tue, 10 Nov 2026 01:16:12 -0800 (PST)
X-Received: by 2002:a05:620a:372b:b0:93e:4e1e:aafc with SMTP id af79cd13be357-9479f34050fmr319496985a.36.1794302171899;
        Tue, 10 Nov 2026 01:16:11 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365ccbccsm3833527f8f.44.2026.11.10.01.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:16:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom: add missing tlmm labels in examples
Date: Tue, 10 Nov 2026 10:16:08 +0100
Message-ID: <179430216678.5751.5703304035925028288.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109-qcom-tlmm-ex-phandle-v1-1-b77b09e6ec9b@oss.qualcomm.com>
References: <20261109-qcom-tlmm-ex-phandle-v1-1-b77b09e6ec9b@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XkX8xWs4ICjS9Uv0bBVw8T2_MOECemRT
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af2e0dd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qIsIWIQgnqTSJORAk48A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: XkX8xWs4ICjS9Uv0bBVw8T2_MOECemRT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzNiBTYWx0ZWRfX3l1XWqQX6ebh
 oWiADwpJidNw7/VGmNosLRY5agSYN7/QQb20jq34eDTqBlTbBMdqd0sFUkIk3Zh6a4EEGHzC5SI
 38E5ft66/3fOd0PtokgqHndDLq04ymI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzNiBTYWx0ZWRfX44GdUtJWxJ8B
 3T/oRfMqjHJVnVmjL0MlEmCy65tlisGoIJA7f0gnlrCVvA0Q2kFQzMZLiChloCbe6ITXKEFSyDv
 6qZXsbM1P+5K4wRj/zn78evn2PcA7BXu8wd03SftdFMVFCGhHF9mPSBR8qOoWtUnp2CNj1Rdfr7
 esGeapcQs4QM81IjJ1pRlIRHYdgS3XeaTpJ+2dpvcK37L7R8z1OFXHGfJaekxWEEfGhhMDfSAYY
 Wl0kqfC2pffu5SogA+noeF8SMHH266O/J6u5OKt3yK7AGGSfivBhXxRqujSynn637c3PdvKHxym
 pZaO4t79/BLx30zgAGPMkjplVhfqjQ+x2DUlof59Wg7JdPQN7/HD7Wb/s0EKWzyBmv7QeL0+M/i
 GulMVVGk+qgcyp079DIuSJlRkYfuC/teNc50xUtmG0lfVeDa6rjhF5OKxZJY+KH0/3NGms2NrhV
 Ik2YK8a8NI/8zMcUMIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100036


On Mon, 09 Nov 2026 16:57:25 +0100, Bartosz Golaszewski wrote:
> Several DT binding documents for Qualcomm TLMM pin controllers define
> the gpio-ranges property in the example node that references the tlmm
> node except that the label is missing. It's harmless as we ignore
> non-existent phandles but for correctness and consistency - add missing
> labels.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: pinctrl: qcom: add missing tlmm labels in examples
      https://git.kernel.org/brgl/c/54820cf15cbf657df81b10838d8d208d01d6c3c1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
