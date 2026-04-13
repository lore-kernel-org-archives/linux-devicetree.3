Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB273CAE76
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 15:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776093939; cv=none; b=f7Xj9uPF5RkvPshz5k45DGrQYhz39tpMLhDQdI4WhjevaHn10sCCJvjv4t6X3yiG7gjuF45pih6XbLjnnEUkse2JN8K5lH2sJLfplFl7zQkQrdpNKyrjdj63LTrr+vsv+JC7arthJskJOctbHjFyEDD8dStrJ08UQz+jkuTHOmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776093939; c=relaxed/simple;
	bh=GYGj0slXz7KuN30SwHL2g1WodTxjyroqUBFhNeDtSwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JJvQ95nCfhF6IoRJ2nQxVkfHyTGv8CqigHXzSxLSsd5kDkQY8dRPxIr2usiY7lvhlWBQQRAwx8VAmstUsb55bW5lJkXehQPcgie1NhqiEi04KPLcP0xxvl1zvB0t4JnuqaNRdutW5cCJh+ZeD+hDTDeSbm3eS75V7GFSVxW+sz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O+mOuETM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F6OfzxFQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+mOuETM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F6OfzxFQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DDwPhS3567914
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 15:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W7S+vUEanThPK3tKQ/ENkOAh
	TzWh25gKbMRUR+Sltyg=; b=O+mOuETMsOD1Hdkv36rivzxWGgghacXt5ZiaJjqH
	VVBGfXm591/A20ThHPCWqWm8Jees5az9nUawjU7ZVmTdROLmn+dy8TR55rXN+j9L
	nqH++4GZQbX4etCtnkAUDol2pv+4uP12GxSIzZ2IjEsNhPiNIoYuy66LSQs811F/
	saVfY/NlCRUUUaZaRxu3b44Xj3YxbJm3LFnV+cSmoBcQBaLZu1kEqhODm4trUcB9
	Ah4K6y9NDB1ijXqJIYj5DC+KruGbAZyBGuD6LpPwTELN+m9PuTz4O1vYLMnZO1tN
	hh8xrnnkd+FaXeASaSgNq6Mjme4jFS1xfHzbWCjpKTo3oQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh1uf0cmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 15:25:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b62da7602a0so3223862a12.2
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776093937; x=1776698737; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W7S+vUEanThPK3tKQ/ENkOAhTzWh25gKbMRUR+Sltyg=;
        b=F6OfzxFQRCgkBUuUnxW7JoUJ2Ljui5FxM1Go8oqAyyrUBDTsbJ4lS1T+UB9XIdrOx9
         7VT4AlALsxzsJ5k6tSDeZqkD8Rt6fWX5aLvmst//EFamVGW86a4fytnXv9wLrhB5bFxJ
         xkH+1wzDAgZVhUdju9NtkUjeLo+efN9JUZG9ivSW1AeTXWDjfg7e/MCPXSQQMpp7PX4I
         FuyYsmIz2ML82+0jn9M20xrMI1x+pSTbN7HTwaiSXJlL/QMs1dsxqzGzPma3opNwLRJS
         FDDy8cju6DhsDTUDX1cgVY5HWJ7DcCEiWYCcFNp7seZgYbK8Qi4pvJQEbrUAFXOnI/Dr
         dtwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776093937; x=1776698737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W7S+vUEanThPK3tKQ/ENkOAhTzWh25gKbMRUR+Sltyg=;
        b=p60k4xJfaC8n60OAwC3QA2FXGi5EeBDnHq7gWSmHXpNSi/IW+mJftGPL1mUiiuzydM
         ZOMYpo2CZ8EMgvwPheDS6xcVCxtKDAMnxLRz61pgJnIKdWZncJXmZ2kjK1qOfeRpUiHW
         Vs3Nxh89IOd6cXAPSXrY1lDe8BracWVpLAauifNDwoO0cyyjyjNsXaWi+daZ1Hr2bBXu
         zH7kRRK9tSCcOsv4Zt+UurhV7fss7VsZm1LiWISQoB4ZnmpMGuv3VwpOZAl7H8bzfgmg
         j0NWmAQTOwvboWfwdc9bdvU7Dx5y5gbQTHatyUevcQTwbizHVslS7HZlxSXKeNd6r/JN
         EUMg==
X-Forwarded-Encrypted: i=1; AFNElJ/s8c70QBjCLC/8camEh6HN7EQNzem06IA7P0IALJ03qEphyuvTJ3vPIT4NNAZOpnquzchjiTcUHYO1@vger.kernel.org
X-Gm-Message-State: AOJu0YzD1J8hBE5Is1IFTxh0Hwt4xYlRrDCacVeDojnn0SzKox0uJsnx
	6Qis44LpIYpgjbxjvwMvH0LxfLPlszmBxmQXouD3O1cPRtz8AlDCIrUu5uHm3ewAPiEJb8ybyu4
	HBmvdbIfdodp6I2fh2E/PELCgGsksn/JX/uHI8RdMxfgC77ps9wxL9KF9nb4SVrEH
X-Gm-Gg: AeBDies2DaXTM0GA9tKQnjssop20YOdBk1WK/FFAMpoSQWDpMv7bHuQgBrIcNHgV/pN
	64segB+UtysqQHQxRfYa8e9Hq+cqbhcjQ3+0T6ykcXNX2/JHuZeMBcGHGkrJ8m5Fak1ziCMHzRu
	gtm/KRYPWJSDb6PF/q4WH1VOGd/1Q57Z/x4UJhtsuD/nRIH81K3ZAoNoxr4qWIzNgCfewbumS3k
	8wsYTYAiA0UJCjo97ZsfdfliqOZ2mT2G3Cnx3YTH9EJ2Is2azpb+O7gl2rsyAF/qD8OQ1eODl7K
	3Jq8R7wxxuBlXZsTXYU2nlzrSw3Zs9pNQ965vC4uIz59S/86OzbpG9Dsqq9t6NOJNRPyb+6yPuq
	aJJJgr/osVFVbJuNDqDEGtBaPkwDpvwHumD89v9WlGUkw5kgT
X-Received: by 2002:a05:6a20:7f88:b0:398:c2d8:153 with SMTP id adf61e73a8af0-39fe40e3b2fmr15011291637.56.1776093936885;
        Mon, 13 Apr 2026 08:25:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f88:b0:398:c2d8:153 with SMTP id adf61e73a8af0-39fe40e3b2fmr15011234637.56.1776093936300;
        Mon, 13 Apr 2026 08:25:36 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79216ff41dsm9633095a12.2.2026.04.13.08.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 08:25:35 -0700 (PDT)
Date: Mon, 13 Apr 2026 20:55:28 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Rob Herring <robh@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] soc: qcom: llcc-qcom: Capitalize LLCC/EDAC in
 comments and diagnostics
Message-ID: <20260413152528.muemkbfuow2qg3ta@hu-mojha-hyd.qualcomm.com>
References: <20260407-external_llcc_changes2set-v2-0-b5017ce2020b@oss.qualcomm.com>
 <20260407-external_llcc_changes2set-v2-3-b5017ce2020b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-external_llcc_changes2set-v2-3-b5017ce2020b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Dc4nbPtW c=1 sm=1 tr=0 ts=69dd0af1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=wMJL6MW5WnhTYwIOHwEA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: i1gNOCXr_AQXHsio_b-ZX3axWZKK5aRP
X-Proofpoint-GUID: i1gNOCXr_AQXHsio_b-ZX3axWZKK5aRP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE1MiBTYWx0ZWRfX7jq9iFCy8DsI
 DPMV5GW9fcNn3lQYdtONFNqax+89ZJejP4YqMropnMQTgXIAUuZv/e9DpGWyuPxy+pXxjsIbm7s
 Q/mvTwFOSq+BbIomgXmie6OIkmm7J78XWP9etcjKVNmHVA9DkAnDoGO5JGyYgku4dxHXN9WI9/I
 GxJ7dkuq1ajI4RYva+EX7PxmDYvRgDD/WvmvKHu5n9+nfMOPBLlK218edgnsFTyafG5oHhOWokV
 J+0A0EBHirxN6SGPCCLg4SKKO4O5Ekmm1fqvJhMvaZWJ56IvG4QuxPBoEqYOBbgvo4/jvOSZzu4
 E7trGTEMXxQfkSXRFQ9ATIw90mJCr5V1HWJAQX8HR6G5a/kBiyeRCod82/WO3KFRHK2qeFTJc8d
 LHxpMuHJLT0fnmjB8IBkXE317I+5K/Fq2gFokmSKtYQYXSOyTwEQv7K6rDY/39FxwWLpd+zA1pD
 3KUhzWpEqf5eaydHPbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130152

On Tue, Apr 07, 2026 at 02:51:49PM -0700, Francisco Munoz Ruiz wrote:
> Capitalize occurrences of the acronym "LLCC" and "EDAC" in comments
> and diagnostic text to improve consistency and readability.
> 
> Signed-off-by: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

This could have been sent alone..

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
