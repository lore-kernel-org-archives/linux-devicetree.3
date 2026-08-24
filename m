Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA03331ED1
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787552921; cv=none; b=FVRSa93455nDSGZzzs5sUp2eL3IXojLqO2TJolSy3W6DLuDpEUye4GfQbg6OKilIT9yNfmVGFChEDqnx/5xtx/WlGaNRyL48vHh0jOOXEb1HPm+bnH1+eBaDkf+OLOPGOmesvYKk+jZbOrbAhJ3sEm+9NSCKmP26YXb27uR88Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787552921; c=relaxed/simple;
	bh=nGG5gGL5BJosvmXCq30nHJ/dCyCI7HxSn6H4EFm5O9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ASuzqDiMMzPvIGd97eD8xRLrbKNJeKU7vEcpCOOfNZEkwPDsR5sbeP7Ovwf2mnsOlhoqQrVksyyXqnKj9Qja9/VEZGY5cWLlINKz3aM+HBHnMnSlLDDhxqLaVVHUx9aGXBrt64VokKJjzUHbT2+/Hik/WyBzGT+400GzGwtapjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pvbe4WfY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S3O/qPRq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pvbe4WfY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S3O/qPRq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RGGE3067019
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ULN21jGpBjc4U+qlBw0wBK8ZBP36vmmIsGaa+ga1/jc=; b=pvbe4WfY66mAwD5K
	1F1FAog3/ZQ3zycJp7T2I9iDMcIgQSUA1Fl+MWpZNMhqpQIr+/JzsuXdsBZmMqof
	F494V8F+IcWp08lUfLZV9IDE+BwEjlqK2B5o5VkXtdxdURjS9yeV2EHRdvxOu/Im
	QUhblq9/bCmx+3CAVoEsSB6LjGeuGnOOMF2GLrTahdSvjocCT/zzCyUn5GCXt3gY
	fHtumkFmWPADCN/8bIbu1mJNZAjJLTMp0VYbrp1jVu7FCjcW7Vi/HZsysQ20fV5M
	SymzTEiRPuBhS3R09hKba267CAhiEBNvFe8B7j18+60nBn95ij8+CTpTYm5GMu2k
	Su6wWA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jph54c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:28:39 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97bf9109ba9so30234241.2
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 23:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787552918; x=1788157718; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ULN21jGpBjc4U+qlBw0wBK8ZBP36vmmIsGaa+ga1/jc=;
        b=S3O/qPRqacnIwQy+H3pS2f5VtaB6qs3snf5ZFeI+/kw0BuZ+LxpAqXh8c8nueHJJ0p
         yH8PcN1qYJPxyzZgxoRHJGTunLuEeQZH7koeJKXvRaFw4KVyYQ9Ykgl98/XWe2gwa5MK
         Pk0JzuElqs3ciEI9x+y9sQXy/7P3zzMJutSU/X4rCXCB/uvCKen6QvWTpFgBsyxvJzBy
         uJ5z5T+XmavVZdk3XzEIEjoCQEIHrrrgXGLesTe11PJ9xHZNXqjK0KnHc4fCqPeT9jwO
         fJGRMvCTmHUOhJfyX551gjYHNmRQgZCmh24Ikxkj/WUHsLZY3cFwob8U6gSqjePSfmqZ
         sUzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787552918; x=1788157718;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ULN21jGpBjc4U+qlBw0wBK8ZBP36vmmIsGaa+ga1/jc=;
        b=oAzySEXVQgMeo0AGPfijkRVf5LCpcmPpEa62ASKcAw+DzGPW1Nb7JaeWQIxcJR2rlX
         /Sp5SzgMf3TX3eNXhZpkww2W9W642RdP8a1FjnUcXhnb5ihBMlr0TxLJQV7eM0UKT+Uh
         ubaDufoKti6zrKPy1iKK9KLnerkz0G81Zb2pJdxk7BS/YxKZ6A+ilDgO78bkgaWfipVQ
         r8gBDKo44Z3gavqAKfIcJAuWMINK49Aysc5VrxWQ/DC7ggkjKoMvtSw8AtbSjfZuhtZf
         tOpxGuPrrxR+gBqrwaJy8DKxuKQsmjUQJ+0Y19VILNxxcuinW+D89+o/PfP1OBsvwSGh
         E5fw==
X-Forwarded-Encrypted: i=1; AHgh+RpZ/54rqHU5qIBt4ousuORdTqNCgKX7oVRKUCfpOf05+xVswMnZD3Qbwrv2WOSQiFYoNej9LmvsEukB@vger.kernel.org
X-Gm-Message-State: AFuF++klD3RjtLhg1hAcwUwU0jVLdb15zk3wzFzu2ngJtnzo2tOMACMz
	Yblw9/g3NcCqXUb1hR56Y2L8zo2H0ul9Gtht9gXUIBogOdOwqrQXElm2mh4LhftDkL0pgL1c3xD
	Vb+v0UHqHN3UsJStXeXgLr4NQt3CarQwrXu83PfrmEeaccQgxveBftkAB+idfiI3U
X-Gm-Gg: AR+sD12MR3uUYWMldBKvCgBo4DczRAs2+zBHEayS7G6qW4j+bjQlLeSuuJKlvYz4d7b
	c0b/4tIaXyCsqar763q97uEkvkURTzCrsLZcOLYmjoSe2c1ok8i1aErEShl6Y3LJnOqFaWAFa5j
	bOMDQ3ZxhhoKhEj/PocI6jwjZNXbJ7JRc9dDIgviPzpOe6pDHhKoDxuU6Owj7CFIVi/l51gt7UP
	vmvqa+s7OIyUqkHPScBN7oZa6aumkNMdUGwpfifJ5AsMNYdpPkG2/msGQ3GliHAHRTho6z2uB5Y
	PYrNFwnKl7vdR05Db5oWpe7F8OU5aImwfw6Eqz1wLgINQFr8mQK+oDzz26m5kodIi/twAHGgSMU
	rNlaMoBJc5XI9vgapWlv//bfe
X-Received: by 2002:a05:6102:1594:b0:778:30ee:f44a with SMTP id ada2fe7eead31-77a5f2e70b7mr3064986137.0.1787552918212;
        Sun, 23 Aug 2026 23:28:38 -0700 (PDT)
X-Received: by 2002:a05:6102:1594:b0:778:30ee:f44a with SMTP id ada2fe7eead31-77a5f2e70b7mr3064982137.0.1787552917826;
        Sun, 23 Aug 2026 23:28:37 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e001305sm7265461a12.4.2026.08.23.23.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 23:28:37 -0700 (PDT)
Message-ID: <dcd082f4-5db5-43de-948e-7c880aa834e4@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 08:28:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] arm64: dts: qcom: msm8917-xiaomi-riva: Enable
 debug UART console
To: Reza Kurniawan <imkyufie@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260820110347.98068-1-imkyufie@gmail.com>
 <20260820110347.98068-2-imkyufie@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820110347.98068-2-imkyufie@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NSBTYWx0ZWRfX0B2pso8n/vGE
 0SQCI24zlBr71Cv3Bs+QFAB6xy99TWnkOwxnlAKbtr1mQbspdpBUhXIKX9WHWj0k6zhYfDTsRZc
 ZHq6sq+RGcb5JiqfZMfsyvEFMJiINk+EuQlo+RA9glf8+XnVbL/rvunYPtTzkO+zYrwGjginI7n
 /MMKhJx+aEtP3xizZ2zc0kMxg3RMoJu+zhfRblTNgTDnc4+6BXHEV4TgC5tTYqk2CeEjueOX6Rx
 3df57xtOlcFNjz+P4KUQnlFFHtH6UIuYuIRoCSbQU6fNESsjP51Mmi6u/RcHm0VdmCLXkYly6uh
 kxQ6EWpZzSrMdp+iRNTwwaX3oJTDt5vLHG1+e0iSFdo7/N7M3g04zIgvxVCVaJNX4Zm2W499uqK
 EDhPxY2V/Y3d4JazSO0kwNEGRCPitN54oi0ZawQztOsBtDPvqZ/XITOqWdAu0eO40Vyt9eLHOOZ
 b5HbVLQLHHHTDwnreNA==
X-Proofpoint-GUID: D4AxE9LV_ZBAdWFAHw5omZ5pYxfjTN_g
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NSBTYWx0ZWRfX0cSOetdUpoyW
 RYLYB7CuIAHkkzr8kTJBjKd6YQGiLV5Z8I+yq70Z31T+gYL2gzdc1X5htvXbSzax8Ay+hDytV2X
 jhf8Vn7N8oi0H5JUiErxzBJ0t/BQ/fw=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8be497 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=LlddjKBcuzzq9C0M1K4A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: D4AxE9LV_ZBAdWFAHw5omZ5pYxfjTN_g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240055

On 8/20/26 1:03 PM, Reza Kurniawan wrote:
> Xiaomi Redmi 5A has accessible UART test points on its PCB, they are
> routed to the BLSP1 UART2 port.
> 
> Enable the blsp1_uart2 node and configure stdout-path under the chosen
> node to allow outputting kernel logs and facilitate early debugging.
> 
> Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
