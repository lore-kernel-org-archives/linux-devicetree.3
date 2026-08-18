Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593A1283FC4
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 13:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787060814; cv=none; b=DXYv5nxBVbAvJYn6oUdHPrucbqEAJCNEdbVSmnZrOju2EW6kjmOQIXBJfXhz2FJwOSYX2uCQ6G/7jtNeIlS1tk6tqWFV1S0En3f3qM9MG9gDlmwj1vj423o2EKbilbGclVCcaoaYIAtqEyXOpzasuo+6y9v8qbfwy06vPfECaaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787060814; c=relaxed/simple;
	bh=dwH9T0yZ/zWlDQOp2E/5CHqLkC1IHz//ocRWg8YITLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WBoTMujbe3LDk2EYdN1cMspHBDPOVNlNBokVbpx/fPlQYMDj7blSxjIM/MmYMZJ4Vcl9xpYHAsj20P4yfv17mY7r5bDKmPhBJVUNioJV8TXFFF7JH5++rGrscdA8Y+J4pY9DjysefB7ERmbtBkYG0D0t3DdwPlSj7Qm5gDvCljE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8wvkLjP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d2RGQFHy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8wvkLjP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d2RGQFHy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IDQVtu1425510
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 13:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yIDFFvak9lqOUUtb1uF7npV8tpUWLLtR7eU8k/ZDjA8=; b=Y8wvkLjPTyOMINZn
	muDKNwuEMB7pOJAZxwoSh8vTBc+sYXbhbuqGENde5MO2OpYGYeYqZCzq1picKa/h
	BwoOM2Gxpr6hujKUrhvZJ+RWM2HYXEwrEQvb/+KINQpTIJO+dtSqPt6vGUPbg7oo
	bI0SdW0tAt/sNH5Mh6hIXupyAP/nQ4Hl/5cfQuglyzxLqd6DNZpIHdz2Rear8za1
	f9B9QYhhh2FnlWkUqt06FnIIlrXJKJNppeabzAfpU5C8hmy7C0jkB3B/kyQ1iGKP
	3gWrFReaRT7xjxQthlPeEVv5/eS+9DaxhoK5go0cxHZW4x85/8YPCO9lPdrrIEXE
	4VUWdg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4prn0f04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 13:46:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934a8cd3a8bso48339085a.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 06:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787060812; x=1787665612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yIDFFvak9lqOUUtb1uF7npV8tpUWLLtR7eU8k/ZDjA8=;
        b=d2RGQFHyr9bUAM7hiQkNkjGpoYKt6n5dLiVN5vorRW3bpNVn57Mqxgb6QmYvsipEQI
         YiZD4KQniHraWFrU1eWHQKuSySL98YiRV3pWRxhrml16snICSM0i7fz6g+P6aFOQ1yap
         phA762XeS52Td/MwLH1/RHgWPGae+SQDuXolC/sSP4Eo6c3TzfFuo28f9kVx/vLW3j6j
         v7CX7VtfFyPDt/sfg+d99DsH/7voWFHGmDmd63uoPkvWME9QAZBxeyV5D5vGthH+BAyF
         gPwCFQayHlb08/B2XZWXyf/7fwdfCWyJGuEk02UOYr2S5ifw2QTUzbLUG6fZY7K2nvpm
         sD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787060812; x=1787665612;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yIDFFvak9lqOUUtb1uF7npV8tpUWLLtR7eU8k/ZDjA8=;
        b=JJm1EOkhQ9gBnuWbg2dRJ1BYVb0wJquF4iLCZvV3ACzv0UNNlkc/wUXJN/j912qOO4
         t4TRW8ACLVGNelp8IuJPbj/zd0QMouvwQmJRBBWVxDdFgVxMJKYxJ0I7saJYzb+463n6
         CDnBtvZGtpgg0pTix8LgQ2+GML9WiE8vRs2i46dYYYkSZJSby6eaHRgtYz3UclIeGZaS
         O4EuBtDffmKl/bgxyF9BEcq9N5E4HkaxR575Ll3p+b6MxcWz93x7LT/cUzHGP6tVkfp0
         C81VccsmydkKO9A7hTYOpC12XX7doN6gHXG7/kMRg05An/jYdfIKlYYZ40PLNyWqCZSD
         xqNw==
X-Forwarded-Encrypted: i=1; AHgh+Rr414L2ssMMtvjPxbzet7tP/l7utQ4wSbsFBVngqefRUl8LpKrKNLsTXZqcJQQ7BdA2ew3XTvg3RYwF@vger.kernel.org
X-Gm-Message-State: AOJu0YzREjjY2HXOrfW5dFOiw9kNcUjmQeMMcMFWL+zBIxGquuC64Dgk
	oA4lRXYg5eaBLLbEBRQ48iXEmy6CBMWd+7XB6Pp/2RqPCOlChygR09SAf8ZQxXIp9g/SbOAAS+L
	Y6eQL8PiHpxi52TNWf/UgD52id82fzv6ho1rxRTUwTK/4km1+BePMkVjKqMcnPPbN
X-Gm-Gg: AR+sD120Rakec7Hqtd61aWvU7c+PMyvv+En1npAhrBOIgS5vo70mqI+kSUwQKg37GDx
	pT00Yw5ydYlUXyN73lpLu4jD/URybqz3+Ndu38wa5KvWIvTBVcKHvkjiEJJRF40bwanyBlaj9R8
	TI5O7w5GeU3NSP1yWhIph276+BP8f7sfnve2rh5sOUZpI8i6HD4VofZIR45UV09rPp8bq6CGKQL
	D+ktJwytY5oBdpJiXcaivJ4QpD4l1e0m5sVjmJEJqhlKvqZYTERBbGaPYtYehEAzVwK0mE4/rQB
	gbV6wZs9Pmn7Rsv4+EX5b0VFHpD+uv6k1tPJPyN4yQaHuUTBYn8y6OSwQqMi/o7qx9dp+gqMCkW
	ex+3KNsJWCku1zcBGQP2/nGgb
X-Received: by 2002:a05:620a:4049:b0:936:5a34:7a6a with SMTP id af79cd13be357-937071938a9mr489188385a.3.1787060811615;
        Tue, 18 Aug 2026 06:46:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4049:b0:936:5a34:7a6a with SMTP id af79cd13be357-937071938a9mr489182685a.3.1787060811024;
        Tue, 18 Aug 2026 06:46:51 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fe6a073sm193887866b.9.2026.08.18.06.46.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 06:46:50 -0700 (PDT)
Message-ID: <0d915f7c-c49d-419a-84e8-0e96df69f244@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 15:46:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Fix USB interrupts in Glymur DT
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260803-glymur-dt-usb-fixes-v1-1-0f5f52853102@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260803-glymur-dt-usb-fixes-v1-1-0f5f52853102@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDEwMiBTYWx0ZWRfX9W6ldy6o5u+y
 q4dg0iYH7oypdONKGE0xYOLHnOzzTmPe1kQW4SBOW4xBRnFSXGZMrz6wHhh1JtF3DrcMFWl78Mi
 pKcClXAWhjZcER7kdPWPgIM2Ipn+tS8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDEwMiBTYWx0ZWRfX9dGMTJEk+esa
 Ug7qf5SLIaBJ9KB9SxxpX3YWQYn8rnQqIT4YmcQNls9NrV3NfCnEPOQx5lSR3wNvJjQmS7sndm5
 J2prifUjwsqpYt8FYmOC5gV20llc6hyX/HibnWaEcVNWlaLSzrgceF6iMu/CKVQaG444ZsbkNIu
 tYqiHkDj8Nl24n27ETa1NNzGpS4AFSKGT85vx0bKZo2DB2UWO5Fj3n+QZ9uijynmBP/taSYR1wE
 iUYSpDYMJICXZAgJXC84Dl1ia/KZ9ozdq1QlrKRo4E7/DaltF2Vs6RM9OiV7kz9TNajlgaB0uMn
 GXvXUQsirp6mSdWICsB4opHDqe6RY7amWSD9mB5a3V/hNgc7zelA3ogfS5DR3O6Oo5nEbN/59hl
 7VORb2AVldini355OzrZPmIDdvFtIwAdpzsx/bWk00ZQiVlQKTHpjbHPigwjf6BTInRxqmjpa6A
 MbSd5OSMpOOIjUsfWRA==
X-Proofpoint-ORIG-GUID: -fvhTZvD5j63R0cKTK-d8cuj31XeSHmS
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=6a84624c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=WYY4b4XhfrXFhKNFVEUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: -fvhTZvD5j63R0cKTK-d8cuj31XeSHmS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180102

On 8/3/26 6:26 AM, Krishna Kurapati wrote:
> In Glymur, DRD capable USB Nodes are missing the HS Phy IRQ. Also, fix the
> pwr_event and hs_phy interrupt numbers in Multiport coontroller node.
> 
> While at it, the dp and dm interrupt numbers have been swapped on HS only
> usb controller. Fix them up.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Everything checks out with docs

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
