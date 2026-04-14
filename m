Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64B73CB2F1
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776161356; cv=none; b=U1qFQvBZkTnYtbrPCpqUbQWe6Mgu18r4uZXZc4y+7QrmXyar6MgZORChN5RuwqDQ4Q93wSFHaTN5x17anqRv3cBNj9b+menw3NoMtXKEqfYmIAPxKvAPSLV/duVrEEpgAnH9vtVOkXkWbhcFl0ZHNR9/BTJL3b60WFgSDWO6TUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776161356; c=relaxed/simple;
	bh=eb2dScdTobRIzTNrg7rH9VD7GbMZSAJZR9XbeLlbpoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SGBCb7qSrfD4Y2ZZH6W9E/wOh/ks/UAsYz0+aTY51hNFEfTIpRJu56iMkcsDScoL1g6RKCpHIO+N/Lxl9ejA16x420SmIdilZ/4rF+sA/rHrJdIZwkCl2PaUjt9v/+oqBMFtlst1BV6MCbI0Q/DYmsNPxYaCVmHF3EeOfqVtIb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KCAKh5En; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AdD2oiJi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KCAKh5En";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AdD2oiJi"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EA44p1029991
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Od9oxCYLYXg/AT3rTTCT1li2cBQUhizNd5NV+5ynV5M=; b=KCAKh5Engfkpu4Cu
	FI5JsUGQ1PUuQ+5ycNNg3Jwjj96xoXPtM4KDwEl8jr8hYhb/OGJWocdVs3mg4vbK
	XT+U70AK9aRYZql5Y1zAUaEaeJIAih/tKyhQmdqZbJBYa7cigRyD/FKY00co0MLm
	kJoRpo9S4dm4JHzeCtlXBGACAZTMdnNM4CozF9A0XkcwBca2U4u+6ZUWWol0TZM8
	7JT7vdvii8REHCu1bdaCDl2XPPle27ym8rigHcZTbaX6jFsdLOtzEMuydmvn9nIA
	5AozK7OJYenK2juB7t3PqeG/ngRnbqeexR9Y/I3btNKutXz9eVstfDMdd4Vh1HRI
	pVLQ2A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhkgmg0ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:09:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d45ebdbc9fso109031985a.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 03:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776161354; x=1776766154; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Od9oxCYLYXg/AT3rTTCT1li2cBQUhizNd5NV+5ynV5M=;
        b=AdD2oiJiKPIc+xpf5fa3a0w4OeQdpY58hB2CFK1vbbw6IQyrP8p325xwCNvSO01QHZ
         E2HOtKZQmvfM6OxnW4eIqBt06u9eqyPnT+O8+9dtfVyMgRjTytOhqteMggmkTk92qRJ7
         3kFY9eQgJktmM5r7d/jVVvN2LKVZyxBo6opg7X2m/D0EYeow+8JHh9/87UjLVRoQHAjh
         O3EAIN3HmqRnoZfryrJu3R/jmQ0/B3pZKJd9AMprvPFyQ+6YJa2BTH6hUy49a9vzvj2C
         OPGNU6rm0pjL92dL5r62RgRyDM9MGB61S1tfxUx0dqhuucBGAPo//COxavYt8xfVZOJG
         d1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776161354; x=1776766154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Od9oxCYLYXg/AT3rTTCT1li2cBQUhizNd5NV+5ynV5M=;
        b=ZGLUEAwg2OxNLxNVhUo8X/GNIo1kURXy2EVtbop3oKrXmaV/yNc+rctgFcZMAOygM4
         h9g2BNy+oHXWNQN+CFvd2o46Fh2WiU6xPmCKWVRAeIiHVKe/Xiod8U4qflg3n8tzCcmm
         GDVRErZrTjx/PWXAMVc0w7qWce03Cda/G/g5J35eAQskDluekF4iTts1FSM88DIA0XhQ
         9Nvew/in4cTOq8043tWdHk7GcghBsZVtCf0SSLRRe0H5ZQ8SMOrrrP28Z6Eu9agMXY9T
         YnYiBZWoSiCclIWSqPhNQ0kiAMztJMnBTku0Q8GtxSW4ccgOgDiW/lDEvK3/DZVoKtMc
         fwDA==
X-Forwarded-Encrypted: i=1; AFNElJ/CZ4fMuV2cs+vmM229IdiEOINhWRACpC7FS9CCG6MpQ+rkHjk7CG90EEpto9uVT/nCO3tuyCyWRpPc@vger.kernel.org
X-Gm-Message-State: AOJu0YzhXRq0Pv0oIJ576s+6/YvkxtUBPNWr2hqswWxomR7wr0tP7WgO
	M2SocL1Nky3gPcUJZIZsGNZrxJ9hmQtD9ZTd3an9kC43szQ/vdi4+PYKx9A1jqpYIeW+uZdx7Lx
	em6HiauiUOYw+AmfhYSv/2w8YZP9CCId84gzyztto5LEC+08f663cYtDET/3hrdJx
X-Gm-Gg: AeBDiesdtOF/DGA3SERiYoKhQVEcnbJ8H4vYI+Z59gymLGpZIqyWuQrg+DdjUOjpCwW
	J1Or2yv+hGguhpBoSQ0Uj8U5wj/Mme/KcGuPw4VcI7rMhODQLy2ET2ez3oZNFEN2Q4JnzQRxgHP
	+6hl0J/LhI6Jhl0VDDwn/FfH3jmulyxBNr1YILF6ch1rdWLSqOauBulWmwt2MUG6Hh6XMVurgvU
	xC8m5Wy0rQ2qNFQWiGkwR1zDrsd37TALIJxWnmCG+P+P14xYe7ZDE7XgcNQM8ZDK6uM0G2nK3Ru
	LdYaWoT0BlBDO7ot2/KXSVhaCkWKMiWHAHQsWcyOaREhZwU34kSdW8ogNSUFIIvBJoSoDaVPcXQ
	/SgWScq9DmIqBtF1Dc7QqV/SzNAa1QWOafMOm80aGPGnRLLf2p83HIG9uqZjATlyMEtlY6che5N
	G7Q6dpr55vbVgBxQ==
X-Received: by 2002:a05:622a:1827:b0:509:a3c:e390 with SMTP id d75a77b69052e-50dd8236028mr161855681cf.4.1776161354021;
        Tue, 14 Apr 2026 03:09:14 -0700 (PDT)
X-Received: by 2002:a05:622a:1827:b0:509:a3c:e390 with SMTP id d75a77b69052e-50dd8236028mr161855441cf.4.1776161353597;
        Tue, 14 Apr 2026 03:09:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-671c4f6049bsm443997a12.13.2026.04.14.03.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 03:09:12 -0700 (PDT)
Message-ID: <78e6162e-c48a-421e-b379-1bef42685827@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 12:09:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: monaco: Add label properties to
 CoreSight devices
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
 <20260410-add-label-to-coresight-device-v1-3-d71a6759dbc2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410-add-label-to-coresight-device-v1-3-d71a6759dbc2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MyBTYWx0ZWRfX4VjCaHfJLbkm
 H5NuYla3VgMQWtiTj1GhnYIAmdfSmQu46LO0HrcS0tFmyvVFjFCzLberr5YucOvvpS+YoImBohk
 M0dHPJJIK8ICLcFwfjiavT/4s0nZghYTPg5KVf8GHHPxsYAuyYTU6hdLfhw+cXwdgMIV6/6L4wb
 8zcolMvmn/uCjCmjTvfOSrcmn1YYXHcyb0bvupN5oCm/wBpDJuNo07zwNO/7paw+EDCUkv6cOsG
 XBwB+BcdXDTcR2kiKKhQNFuIsLD4hWNwx7QreonAfAXsH3YBVwMgp3oXfdQyWu0zNpkLTk5QXzQ
 /SVqHzQEMk0NdEec32YMDoJMhVkZ2gJbBNl5AdY8dJ5aihsJYjg1Bgn4bRkt63iqPUX29dIi2HI
 nrdNrfuwIkFyvAuIsS98+LelKeTIMgp07oYumenrtWX18OKJnfqIRcZKIBiJGgPfY2SJgeNuz8V
 UUCk44lJ3rbF/+VSwqg==
X-Proofpoint-ORIG-GUID: uWXYKXbrrhS6Cbv2NUdYUG8TG7u_pxXF
X-Proofpoint-GUID: uWXYKXbrrhS6Cbv2NUdYUG8TG7u_pxXF
X-Authority-Analysis: v=2.4 cv=HJLz0Itv c=1 sm=1 tr=0 ts=69de124a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=vlsdytxVHXRVqql0IiUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140093

On 4/10/26 5:08 AM, Jie Gan wrote:
> Add label properties to TPDM and CTI nodes in the monaco device tree to
> provide human-readable identifiers for each CoreSight device. These
> labels allow userspace tools and the CoreSight framework to identify
> devices by name rather than by base address.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
