Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4921C38B7B0
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 14:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788271986; cv=none; b=noKw+CkhDwbuBKXTThw7vGXFG1owJIizqZuhQy/fMR2qu9LlPA9p8KnMRQwWpRpl15PhExCAq1HWQLxEi9mrSVJ0sFv9n/+r9FZUfdz7kVa3+lYXjN5p/p5dKP0FvQw5mm+4vuCMF6c/0KNapiZI1gIvtkgZpIQnZlGWU3NbP2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788271986; c=relaxed/simple;
	bh=1l6+B9/kiT9XZBmBIud3PCIdR6DEYQtW0/56aYQAQ1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f9sbqleHUNmQqyprDodW1CbfgdLrTz3xlDL96Jr/hBJguJhR+QDQn+oMzGUP3Un1AhhthBdDL4/xhV77ooUSYtQ17HP2xaGMIpGJL7ztX9vs/CTpe64uvjdQP7HUB9aUN7ZqZDxsgh1SRMDxA17bYiMaMryF7xoV3YVp6zkdc20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sp5GeC8t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F5dk1Esi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sp5GeC8t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F5dk1Esi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8eVB2825090
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 14:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TuaONZnkIC0V5kedHDHgzsDhrDPLgKViMEylIZ9pSng=; b=Sp5GeC8tPG1fki38
	dE+/CQmbimwho/R/sH9Dv4SWMxK3uIE8VlpM+fV33MXxu9uskSgMqiPFv0svGdtz
	fS4N88zKhVZnX4z0zsB9Bw9XThir09l4joPZoKrzLSQIw5YJ7nac0xlqQcAA3MlK
	OnUVqazeYkECESTppblROss4kt65FnkiD2q2E5u3S5pRkQ7oFsin7D8SqZxRDUgQ
	Agpc3u72zxpqm8WoGcbACAWa2AVZDvJrpi4UQ1g3L/hAVh7ogg/PkjEfzePkNTRz
	EQu4Pdse0v2jVLclRE6flGtSkx8mON0nXjDPa4bX54Cr8dYISmKiUHwRqsbmcq0C
	kEplPQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7cauws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 14:13:04 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c65b0280a2so104809e0c.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 07:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788271983; x=1788876783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TuaONZnkIC0V5kedHDHgzsDhrDPLgKViMEylIZ9pSng=;
        b=F5dk1Esic8qusP4gU4v9K86LFKV3kj3S3YGr+Ru0A7UCtb30xf8uD1avTRRN6pR8YP
         i8s2dM4umW1AQL0+j+i9U6uo49r1XnkmkehB46yFl3V0ml+mceA/nmqfkwe9DbB/YmoA
         yWZCJFXKQ1uxvHSgY6tShv6hkqE6S/4j/esBnwq7WJNl40xaVEVS0rfJfHQb/iGKMb/R
         XYAomI3XZjtwjIhrMbsp1hujG4gGij6KPrgAwNhe0WXyUJYQuazdYgFcqgSLAVEJFK1l
         5b8VjAsExXeYzZxQ186/vaEH2GMBiM+/fjZbKyk4U1tIE2mTEnCQdAZ1aWXQ0GNIkCxX
         4yGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788271983; x=1788876783;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TuaONZnkIC0V5kedHDHgzsDhrDPLgKViMEylIZ9pSng=;
        b=e5SBIAUUnq4/k7UoeHpDnddda4KYb9xd8vuoCFhRc+hIsCN5aOIRyRRmiTx3fDYdV/
         9hkAgVFquc0XzK3d1oVNlnxkGU8Nanikss4VgIjAK602JsnbXmNwIZKav4pVcfGQuxRj
         iSysvL9fJX7P1tICs6k6qiFvl7qBG0uJszYBc2QVHGKIFkuCZre8hBJMkAAZf3NX5rIp
         VBgx/ydk3dJXkDAs97qL1jRAQSkoGuJN2WFSq+QDCyNvVyYtVHXmISDUtTJpAuxuCMUV
         uT7YRPdYogjZkCYE4tye/VTQZXF34aK+TIQveaDwu2/cSba0C2aaE+NgDIQ4LHZO1C4L
         tF0w==
X-Forwarded-Encrypted: i=1; AHgh+RrUi56WjlcDR+Es+WMJhkcLE0ePQJzBlTSO/NwainsFuSKh20JLD5hustq4kEjhv/KK0jgUeSzREdeC@vger.kernel.org
X-Gm-Message-State: AFuF++kjGoZcGn7tfSmYni3VuPjR4K5/24U9A6LSlKrwKwAs/wAlgUhr
	yuDGkFzCYdjuo8IUrZACjPZW8vU0CI8uzljlHGhC5lxZ2sT4VdUb/xWxoLx+wGeBOnkUmX/dLXn
	zRv78jpe2NeKY66xblhB8k46Ss2sPnM/ThgCGRNgdPrv1VQS/W+i9Cx0chwH6FovEoH4yX/BK
X-Gm-Gg: AR+sD11WproBOzNKkecWeME/vrrAZi2WS8nVHtQziDbmlmcHyl3h4jhP7Zg5WmKNx6P
	tC0lvJ4QO8Ox96kUAjux2+UgIrPN/W7ojMNZ6+mWbY0uhOKS7cfEJov6Xaqo2J5SWKv/61BVZpE
	WeOQUWDIBVBoDZbVz8wEGG1VKAUd8qmH5gLLzvexNfwR87YXh0tk/uAFQSJHlS+RfxWFshmxQVY
	Tx1H/Ot/FeKigTxXZxpt3YyPLPEqB/Z7yrmw2bB3WNOLvaNaV1PMFCkUU2mZaAXun3FLPBnaET9
	zg3b06WMSf92WP5WAzmtT30KeDLIVVIfhrlHHh51iFiXvYGS63ZcBv/Ai6RGsQmpGtb536468Sl
	Bp0XteuUNSvohG199xeGLMg==
X-Received: by 2002:a05:6122:29ca:b0:5c5:b075:40a with SMTP id 71dfb90a1353d-5c68140e41fmr4674725e0c.2.1788271982939;
        Tue, 01 Sep 2026 07:13:02 -0700 (PDT)
X-Received: by 2002:a05:6122:29ca:b0:5c5:b075:40a with SMTP id 71dfb90a1353d-5c68140e41fmr4674693e0c.2.1788271982351;
        Tue, 01 Sep 2026 07:13:02 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a673034295sm718367a12.26.2026.09.01.07.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 07:13:01 -0700 (PDT)
Message-ID: <a45dc2d0-1c46-4909-8d4e-d7aa57acadc7@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 16:12:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: talos: Add RPi Touch Display 2
 5-inch overlay
To: Abhishek Thomas Varghese <tessolveupstream@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260901-talos-rpi-touch-display-v2-1-40f0e92b2071@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-talos-rpi-touch-display-v2-1-40f0e92b2071@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OcyoyBTY c=1 sm=1 tr=0 ts=6a96dd70 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=23Cz_ppem3x0p0_49vMA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: Ofn6hAEgi1GJRNpBwS5dHsnjZZX0WGbZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEyNSBTYWx0ZWRfX/GhyPUhAX1B8
 pCMAkpuJgsvoH1JFVUP3FaJ+joHe3nXOmEFxYqWQmvcLL5BqMjS+o8IHxDR+yQoCEBSKmd/gX4H
 WU6XqDP7TxjTv8dajCn9EVdMfUINsHk=
X-Proofpoint-GUID: Ofn6hAEgi1GJRNpBwS5dHsnjZZX0WGbZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEyNSBTYWx0ZWRfX93Rshjw3SjxX
 ED+xwEcY9MHL24su7TODHuGaNJraPsY8yND4XXFkDP21DYRZMEbzzUO9VcnzfDNBcZd9M+lq7Sr
 QfLIVa08TIj8FxzujuKq1RYN24usugKVv6ePIQi7DtWNV0NfKbYt8B8cuzZ86s3W81dB50c3iLm
 seHo4ZRT4vRxaiHnqRgyrucrS6F6ObKzBuk7FAb5wHoEfXQoRR4N+BcCjKOCTxMyZg4TdOa/4pB
 UJqVjpsFJKwj8fptBm2x6c1afzHRzC8MXoqCRyxL3gDJQtf0Ug7UwmIr1BuvO14E6elVkHa869X
 6FGZmGm4t5LcfyaLWaRQ4SOwNnez30LxH9ksmm3FN+GNY43JiialkC9Xy23omFoyHZ/QqLOkoxD
 byjJ1C17XejXR3HwKOJaJnV/+ncxLSb8FEATk8cSUo7iO+ekitc83rNiuq4jPolAWsprQkYSuYb
 i8uxtNth/5E+5ACsFcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010125

On 9/1/26 11:48 AM, Abhishek Thomas Varghese wrote:
> Add a DT overlay to connect the Raspberry Pi Touch Display 2 5-inch
> panel to DSI0 on the Qualcomm IQ615/QCS615 EVK.
> 
> The overlay describes the display controller, panel, touch
> controller, power supplies, and backlight. Disable the ADV7511
> bridge to avoid a conflicting device on DSI virtual channel 0.
> 
> Display output, touch input, backlight control, and concurrent
> DisplayPort operation have been tested.
> 
> Signed-off-by: Abhishek Thomas Varghese <tessolveupstream@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

