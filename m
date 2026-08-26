Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455293B6C08
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 09:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735450; cv=none; b=fiXIurorWr6K/aYq7w3FemQyjSClTCjjG1AE2Qfdtli62Wo58U2IvcoxdLGFmSZFOfRwKT8SgoRpJsh8/6RU3jsVC4XvdP2hzMG/d3FXErqS3sj6gW4qhOvtDNVA12h1lwdhQjLmlH2dq1jmEbCL/ka2S2THe6kYx3VRQwyrlWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735450; c=relaxed/simple;
	bh=PirOP/6mYyUgE3g3UWc2YvcMbozEvDcezFy2iEvLvTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=clQd88piNcQohUREfjKHgrUE3UJizdbqvdHshnFgCwbETQWHRq1bepiUK0yICo2zOC9lqkJhn8e0gFyES11UFpbotuyS9qR9nRFCmkee5YJXSt02o3Nzx9uDVuxGVfw6rn9KqY1pcLNXwUYKtB0fLx974iPSuw3IXKkC3evIjno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dIbZPxKo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RD9C98Zo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dIbZPxKo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RD9C98Zo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6Rl303689530
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 09:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f81VLDmDdPRVFVxNVVyj3Y13ljPrGbTUOnFCJBpmiMQ=; b=dIbZPxKozGPAxqSO
	IJW3qrtnZps7x0SAml2qQknW+TSw6ixhchQQEo2b4tTa3gt1hmKQkdJ8gYlWeqtU
	v19rBNr/9nC2CFji3bCilP17U5Fyf6+a8Jr10tf0GgKtS+3c0RCoMTEc7ZqJozzg
	tHAeaqj7XFv7t4XpSglV57LIOqoHBinlkiQOb/Nd3oPrNOvXWlrZTC61mJ3s8O0s
	+VtZUc+f3L4RXAPShAKdbL1pWnOORslQNvUYqmU5wJ/dXEYnhTbF6XTRyVpAuNCF
	gnbqp6/f2pU55IHH9M15/rza+xm7WE/anGyo89tocm89o74YX/mKZ6FjcLRmTHp8
	vIi73w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fjn33r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 09:10:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930bd2bfc45so16275685a.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 02:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787735447; x=1788340247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f81VLDmDdPRVFVxNVVyj3Y13ljPrGbTUOnFCJBpmiMQ=;
        b=RD9C98Zoixl1ABDSpOSH/ftsC6IkKlevV4i0VYJs0a/2mAc3NvCf8FDR1DlnNRUYoH
         M/HmBcW62OeUgKzRzTgajdLFyEdrzWjnsOKLcHkvbKUbXf8PpmTv/9kaYDoZWplU1TK9
         UPNieLfBmvA4MfY4tXZAWiHJr6/7TOWpMmQhh/4gaHeBOeih+BCebfItciLjiW8wKvDR
         flv3bj2+GNky26DvZoFSGx6eXOjHYtrG4raRz7MGqrBTx8Q+iOsJDWIvzMigYIsYqPB6
         pMSi3iZ+k1zAzNehr/BHKzA33joBLqdm/0sHhCty4wm8YWNTdOZ+raEbctmxnaqMT0Zw
         BJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735447; x=1788340247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f81VLDmDdPRVFVxNVVyj3Y13ljPrGbTUOnFCJBpmiMQ=;
        b=czwEEhRroKubYilYl89dGX3bwLrYBTy2S5TiWZgNR/MYjHFNoVunipflX4gfG9O81q
         wQ/Z+W9fFjat4NlgoV64MD1Io5fzUMrpCp0965n+UgpA0Nw7+zGtdgqSo0cGgp2nh82o
         pebLBRo3XmRlRyh9KA5j7Z/gBYR8Bjr2cvef7GZzo/DKj1UZmyFF1rjH9sEOprA4VuAw
         Isi1/lC23NmQRi1T/NA58XDqRm2CXdS5GiqL9PPdz2kTF0GXi0wCK9HTMtgugEzt/HHr
         yafTI+foLvTAW/enGtk79avKPH3fWGHlGnlXrkL+a+Zhsamj/Z512fFghZAIpFjSB4fQ
         r3Eg==
X-Forwarded-Encrypted: i=1; AHgh+Rq2QLqq+F0k4UYQYeiiSvwmkkFOFo1IK2JjxOKnLQdu6LsCS3Xm7iOLyIdpVz8ERPynD4ROB6GttODG@vger.kernel.org
X-Gm-Message-State: AFuF++ny0FUPdfk0GfepB3T1ZERb+MjqyoPWJ3QGkcWWTgxvu44WDwH2
	JYA8jLLNSOqtQ2+I1G4B7KYqBV3tFwyfuRTaLY5V86vi+fJxgGDhOHZERMNqhc3SVFGoM/lkB3S
	NBWcQEUhEG4951OtgkFEkr99fsyLcSi5QE3wAQXFTdn0O+IzPAq21blccsvuUJu+y
X-Gm-Gg: AR+sD10601HPP6Zx8YqYLzJhl83zcZZOm9051oFTn5co7xhPvCY6Nk75JRXbBmzZPhC
	ACh6uB1I7eXKmy2Fpa6KriJdgOeboEwm78l8gj6rUBp4HohxKFn9Gr/V8mCU1kRboOTtFtpLLjV
	7le2j1v3PmBM0B8V8q2ioNYRxIDkSOhzHPV0JsKm3+qWKCDqP3c+X7Tz+/mnU+7labSMk0eYckQ
	meVRw4hztqGzsn5j3h5UmOeOWI2dzOp56+T1kLFSj+3YHmXa5x3y2dQf6kM12WQ4rQgQC947xCt
	6NaUt/Pt8V67R33g0pT462MuS4PRnzHqd3xzXqRpOdkCvwTv0WGqZoVk2fQ7tPOBN91aluPXTjN
	u2VY+sHmL8m2HVpnlPAyVoeKu
X-Received: by 2002:a05:622a:1a8c:b0:51b:ff78:f229 with SMTP id d75a77b69052e-52e424e0c1fmr33738681cf.5.1787735447542;
        Wed, 26 Aug 2026 02:10:47 -0700 (PDT)
X-Received: by 2002:a05:622a:1a8c:b0:51b:ff78:f229 with SMTP id d75a77b69052e-52e424e0c1fmr33738371cf.5.1787735447108;
        Wed, 26 Aug 2026 02:10:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88a928sm419424366b.33.2026.08.26.02.10.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 02:10:46 -0700 (PDT)
Message-ID: <371dfd4d-0c9a-4496-88ea-a3e8d93df144@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 11:10:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: shikra: unreserve GPIOs 14-17
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260826-shikra-dtpm-v4-0-8476223184de@oss.qualcomm.com>
 <20260826-shikra-dtpm-v4-1-8476223184de@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260826-shikra-dtpm-v4-1-8476223184de@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: scyUlc4HpjUzlYgbHZOhR6LUJ5mjDR-W
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3NCBTYWx0ZWRfX9ZaDHCFqXcay
 krCJqarvFIpAoZN8vChtc7blLXTc5PjKCg8IkLlPzLImucy5I/+dYW+BtA4FORfxIOQhMA/S7Lm
 zyJm6EA9I2tG2D1kYBxRcsnui54sAiI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3NCBTYWx0ZWRfX8JLhVzojGZsZ
 jz9gXOjvaGJxXORw6u0wDu8B2lyh/iMEjNubmFqhnMwnzMoAGRn4mvOnRNLHlWNOTfamJarkPIR
 P8gxgiWZSlnXltaKqXplp2FIRvJy4x+sNdlRlN+mHPZKzyjm/m9YWq3cYfaKYkDDuSkqHnjQXHo
 xGYyGOp1xM89PrmI78Hbu2Fr3gxF7Zla/7G5j9Okui6KquE3w7mcWlvnUdb0ELo4rpCON61A0Ld
 ISMes6NoFed6DG+EcM2B27MNNPizhFXE9AbDdUJ4chcGU9jt4CpsFvrv+0kg9xEohdUtxRRTDd4
 45RDED/oP3h2xIwGPLnXRHANC92+ahPJj76MfFiN0YAY3fR+j4oeOHUi6d9wV4QmAUZ10m/d5Lq
 fKms7cGP5sc4uwtoNowP0OT7OpxD1XNHONv0BVnCYukcKcc4TiPAi6tVfhcSi1hTvOdL7MEWAdS
 zCpfs8n/tZe4H2COxlQ==
X-Authority-Analysis: v=2.4 cv=ccziaHDM c=1 sm=1 tr=0 ts=6a8ead98 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=rJE1ynEhMgyPisKzH1EA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: scyUlc4HpjUzlYgbHZOhR6LUJ5mjDR-W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260074

On 8/25/26 9:13 PM, Khalid Faisal Ansari wrote:
> GPIOs 14-17 were previously reserved in the tlmm gpio-reserved-ranges,
> preventing Linux from accessing SPI5. Removing them from the reserved
> list across all three Shikra EVK variants (CQM, CQS, IQS) enables it
> for dTPM usecase.
> 
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
