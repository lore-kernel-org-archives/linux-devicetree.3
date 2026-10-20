Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501577;
	b=algHnxT1GleDVs5TyWPzLtR7tM9neKLN7Uf79o0xaIfkUgSMpzGo5CFKIk3AO3VrfqbO
	 6nwXJb2PYON49E9vDFH1LtYYINuo3TJxrcjl+PKqRoturHN7r2gaRiTKsxnc4idmyDar6
	 IoDzzVTyS2TH1EmE4DLr7e+Cxcwm7bBkmNCGsVXo+JqiCIQKYjAcNi0BPRrC9o+xKGfml
	 BJRAnDCFWGtLecsYzo9HZyP3+Hc++q8+FeRXhlWgcSiJr2cBErjCkltFhFxjb+hrqQF8j
	 7Xxe8Tr0qcOmsmv23phUVJWYzMZkR5JhxwNRJyagzUnnGF40iaP7yTqhG9PAaROOSwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501577;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CE0LblYMBDhwvK0/37IJJYzW6feczp9XAWylbm82xTY=;
	b=MsEB6GZ1dkF0HZMGugZb+1HtlhTKYiihamYMn3fa8b+zOZRxYc7w+0OJHT7DN30ENN8e
	 JKUAVH6UMwEnV66s+n2CzRq3ab6irOI+OwExLr/EzWI3nX1eteBEAdVVhuthvVzpuxgVA
	 0rZwZQPfxjYlWJbnhvC0Ju0HuBA+Roz6LX3azHW174JFtZjLJFYIVaUMfEbilb6MrBFIs
	 sTlk4k7VRolnHSAaJMD8lfAfuEZKrbYuEUkZnoVNn+etWAerdu50PRp6qaezRN8JB/pIm
	 goQ9YW4F7ruhGZdDmkEaTzwPAlO8NzTcEe7l1LmkWiJxY+lZ7YUatZNuxCYOqVa1xCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qnsg08wT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="eVl/rqLa";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E0C606A31B
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95E0C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qnsg08wT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eVl/rqLa
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAwu9V1929070
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CE0LblYMBDhwvK0/37IJJYzW
	6feczp9XAWylbm82xTY=; b=Qnsg08wTR9ZQ891ogCrMHX9ECV8khG+TBrcQurDv
	Fwesgel3VDU/uqrZgfHZfHPHYVgnls1G/gR1cps2J2Ohd1feR1PghgfO+mmKXqMc
	yGktTqNGQWXAdtUTfOZ1ehwBRNB7zptacSQ1sIbIcT660xAgXO8FIuIWvch2fZ52
	i1EydDbSlXXvY0cjw4YWAWFzQyTYBy2ViUM7IBiNs5Chm1eIfHVnJ5nOFVDe1W4A
	pSVgXCY07pdRaM47z4yHQ9OsIQT78wiCvpFiRau299ICdg4bQq2I8Jg54If9ZIIY
	livn1eKq1RDldvsA4I2/RGsH6XN1W9tqoREo+5JZH5u3TQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ntgbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:06:15 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc0a64ad59so425929137.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501575; x=1793106375; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CE0LblYMBDhwvK0/37IJJYzW6feczp9XAWylbm82xTY=;
        b=eVl/rqLamutJg7J+wgICd6B+u6cmattpRX4g0Xl6RGI+aP28ZF6os9Jmn/wEdt2yyK
         j4lb3ECmHE1AIDEm9iIKlG7188BkJHvXLG12Q1JCVg//1Pp1Fq6K+C+KOO337BtuZL59
         po0DEhHGp0kJFFAASVcmxwZtj8fjf2LYHfNnx6FD4bXwA4g/YmSGKAvKBC8WXAFGmhnY
         G3w2/u7i9jQmaO1OEQYfc8XiKYnFj5JOYJFgFUZW/vh1BlP5G5kAawbX3iDoQv0N/fGf
         /i2O4I+IB+KAH3oX6vxpSOjtM1v2EP/THp5HxUQkkSxIT0a/11P/4kpxmprOGDcpB7u8
         mmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501575; x=1793106375;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CE0LblYMBDhwvK0/37IJJYzW6feczp9XAWylbm82xTY=;
        b=Y5+N9qML3PcbXqpFQngholmSqlJfmZAe2BvDfwDirDg6K3Sa6h3AsRQo9yMF6aW0CU
         pbx0R5V0S4l6rcYYBu6h8om/rLgFSPKSkl4fD8XUimT7h80KRYpJfFop1b6nMoGnty4y
         VoQ/BFrsAg8pgPJtAbKzCBn+4lYBIjO43vjuX793qF8teZbiDJe0IH0DQPAEb58xr0rF
         6QxuYv6qRppHJbZyiwa8PPmTkfwjF/DY+MqKN0hia/BMWX1J/y0sm2RBIYnCwEZbmPfK
         c25OHwCM0GCu4Di007wRDkDKdiq+uyXq31ibD5CHXlvnmZwLxfDQrfyVwwIAdw4fiZly
         U1LQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgb6ooOaU32wmC9Z1Yjqj7uioOVeG3xIh5smk0Jgf3TYUvhYfqzW+Eulp5ZR1kq1KeAhpKoqVdQwHu@vger.kernel.org
X-Gm-Message-State: AFq9FYKlRAqkwUm3RMjJl+040+iUAuhYObDzrcoPZ3IKVHcikRutpRJH
	tVMdsZpbpAHqaLcBGU6/DtiHEXWfo5g0OyGxnyzWTomZ3cTqOkL6ItjVXMZ7vdg8MSr2+1PKqUm
	4I+FoiFnQoq9XEjDGA0Tikk8RXIxEEWHQ+G4j9hXTxScfaWVTZmtDKCsSoz+o496+
X-Gm-Gg: AYBFou3p6ws7oxJwyiyynjVUjS0b2NYhE2tS+BgVYbs27rdMUDStCtt8L4pwFtdpXxB
	IL8RcjfgwEE/VoLeMNmTB4Gyg1b0W+VwoBJ8xphcTVV1FROBRFsHoQ985ymsWURlkMshACAUYib
	ZHqzLVRRecjbdJrZ4j8JK6jjixC8JXzZhzMGogfy8MmLj3IC03KhDa5QcV8DzYcP3P0w3NIPs5/
	1wThlkzJtILtsO7GzdS2LBboExSzwMVentgrp0aRHzPCR4j12YFDfGKD3u152g8U6cfzrdFjZJw
	Sq1cif6jsKEftqyjlJ7XHuavYDs8I3b0lEXV0uf+MN/ptZ3WpFClu5Eh9q49Ju++YAdWCKjrarM
	ZJ5sodg6HCSEq+y32
X-Received: by 2002:a05:6102:162a:b0:7cc:198d:e2f4 with SMTP id ada2fe7eead31-7cc36733497mr2642213137.3.1792501574631;
        Tue, 20 Oct 2026 06:06:14 -0700 (PDT)
X-Received: by 2002:a05:6102:162a:b0:7cc:198d:e2f4 with SMTP id ada2fe7eead31-7cc36733497mr2642204137.3.1792501573972;
        Tue, 20 Oct 2026 06:06:13 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d82dbbasm5839673f8f.45.2026.10.20.06.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:06:13 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:06:12 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/7] arm64: dts: qcom: kodiak: Use ICC tag defines
Message-ID: <z2cfdniye5rigkc3zrhazk4zqkq52bzl5tm5mn36ij4lxhq7l3@mh5whmrnowld>
References: <20261020-topic-icc_defines_ao-v1-0-cae8d22649ac@oss.qualcomm.com>
 <20261020-topic-icc_defines_ao-v1-1-cae8d22649ac@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-topic-icc_defines_ao-v1-1-cae8d22649ac@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX38N2M2qsLIIR
 NP2aXb3OpTf6zeL5P5DUrKI5Qj/+dY8cjxzuYKSEKVmNal7OmWMR4MuhpfepDbwV7uXe17Fc5Q5
 ZEwx5k8rp3Tu/p3rCkdO+ZdZY++SlUo=
X-Proofpoint-GUID: Ox4vOtn6WYQKydvI_I89wErIWgLxukes
X-Proofpoint-ORIG-GUID: Ox4vOtn6WYQKydvI_I89wErIWgLxukes
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX3BtNhD9G6ReW
 m03zUtycv7Ai+x19ooaUenyofCLjKMIowR1GoL4dBsoTfdN2WJZEbG8ojfCANI3WCdgG1Z54S9E
 cmy4i5F/NNou4N+qc4+Os77t3KYoKNiqIr1EpSRQog4MgqqOYoTfPKUcY+ZcJDc6anR4W5iP4+Y
 ZX0aA85s3RsOjEsuqjMAOW5bLfxCXpFuEwPuWoOqC6h7ZN47uZtwIQFctJAjJYF9P0SvGiBLL7Q
 64Ak7NI6svnP88NX44l7JuRHUzqYtDuVz1khwcIE2lx1RiIKJrqeEJ3fQbhR0Xy/0NIjooiQrDv
 /x/FfVHpc7eCL5HY/hmHh+Qx00C+aeQXOvp7sw9Fxg92ATJow/PQ6b0rMnbMV0wvwFnyihbVT3C
 aKBabKAmy4/HAEdA4WZa4aA6SYmv4/3fe9yys5r7VE7G5psBJw0a6BTaYCd1bPlxCsd5angOFwe
 xjSWdHbqBsgopIEdh7w==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad76747 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7jEBbBY3jDUfc6YBOLYA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200052

On 26-10-20 14:42:05, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The magic values come from dt-bindings. Use the existing defines to
> demistify them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
