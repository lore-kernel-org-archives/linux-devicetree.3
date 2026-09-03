Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EFC330B14
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 02:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788403953; cv=none; b=prPtpwd1HNUx0awpUBMCp5U4yvAYRIs6zfi8nc2PY+zxySYrEcCVo5JiPbAL+PQGfhWOKZOziYfoSNM4I/s6DDoXs3QyYQBOdPqfbtccgdDY2RXluVpWPZfZpyV/b48ws9jr8I9WMy0OYZrqICwsaKqoofhpyzelor49vSS25Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788403953; c=relaxed/simple;
	bh=zVKvavHfg4RQjdQk1Ihpq3mREXCK9+/dqBDndo4eJCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fawYyEJxFMKxOcE0t7NDpCNE9T+IH2PUb4mNHk6770r/gWVE/GePgpezawkpe3wKUeMCoQYzIFlIVHsUCT9lopKPVh2F4NA+MHWALVeIabzc26kuIlImJh/+iPIo5X04RsmCi+8ii2TjHkE+ijwFloxbo6P8zSQnuKKUrP1vShM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Idmf7Oxf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L3xPlhUu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Idmf7Oxf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L3xPlhUu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682NHN9u2968328
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 02:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P4+m0OoM2a9nRL5KCXeQ3F7G
	JZWJtRbuEyWR85Y+/YU=; b=Idmf7Oxfg/8Htmot8gcnfZOmX33SQlXj6EfqjbHI
	l7kbZX7X933/LWKakb8smrvQb65W3Nmr0ElMQYDbdvk7ysylNjs9r19tFRhWKRYR
	dqJvNHaYh1eUkLOvi4JOJR3f/MpLjZj1tfbD9ZD0DXRcP0f9zNgBQN8Ui5jy96yM
	mBHGZQ1LFFZKzgzK+49/D7N7JQtW8k2dp2CUjk5A5jC0+Lu/jU9L4+h6ydtwBQ4X
	DECnNPQ3ZHCr5jzK1clbc1ho54aqvjjbc/fTdUr391JM6xbMPltt1LJbAosqgN8Y
	yAVfMoPI1eDGHrKmNQF/ngvfinFJkIsUi4doF86S5glqEw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gej2cbwpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 02:52:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so3243961a91.3
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 19:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788403949; x=1789008749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P4+m0OoM2a9nRL5KCXeQ3F7GJZWJtRbuEyWR85Y+/YU=;
        b=L3xPlhUuaxOw01BvgPLDJxjHGUVQ9VmVkQngrYQ5hSM8ZBmAyMTZUeAwogJCzWlq4q
         9loi1M01Da+aYrW/hBpcB8lypbtX6oaz06n7U4uCW8NH8wxPsGVGZijmDFtoT/ywXfeP
         XQetnPjfJztbF3tO0hD5+oPU+5ugT9jKZS9gzYfcUyXQ6CHfydpZHMuLJSNP7HnHu9fv
         m3TZoTNiUMSgJZsHjsvf+iCjaTJUMlcbj9ZLhKRcof4FltWnUbW9BrpI1ZT4ivIl8ORD
         /WkPUav7tV5wN2kEdw0J/O7BAV2nfrn4DiYc2ZAChobYb+/Txj2KpZHdq+LNRYpcLoPR
         OTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788403949; x=1789008749;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P4+m0OoM2a9nRL5KCXeQ3F7GJZWJtRbuEyWR85Y+/YU=;
        b=BOKhDUONytuQbo02SF3NNc3jL2LOieWHumdDXV3vBujGmUPKwwDqL8aSJAOZgs2P9R
         7Vj7bA/1idSbOq3KbiF1GOqxc+2tVbAmyjwrkvkgSInG5pKeCHbEW5FPlLa9farfHqM5
         CgbtLdxFgIKR6GTdkLKhoMLSfi0Q5LAhtOtLex4GCfphRfiGx8+BnjW7fa/Uwvbwok77
         nQSfkzACiEdqKRobEhgUUSW4rxSwb8rEr3NPpKicpjx9lEXMtAtWmLQkogsAtnkqfdUY
         wKo/wgr9UHnaMU1beAcRJlxkK9haKLGH8jitj2E3krSjFbAcNQ24gMvPQGzByV9+OqXB
         8vzg==
X-Forwarded-Encrypted: i=1; AKwUvBwCnS76Dtf40vl+jKvNLqfL5YiL/sLTryO37aHCrKrDHUTdZ6yPccW3XspAwu4S5nOJaxmoIKD9yZqI@vger.kernel.org
X-Gm-Message-State: AFuF++l9sZfxyii9fbVIk7U0H84LU6WZBTKGZH2eOEH8PU9MpNlYCOQh
	LnCu/XXRdwl1lrE/Ks5kIJ3ZbdQfaSYvIHzLdWQlxS8shQyVRdBN06cgWQsM2u6gGyp551JQED7
	cf+KtY98+YSJ9PcZ1b76lwwm/N2DEDRg++ZJGUw9xziqRcpJCwusdywL4joOFX3WF
X-Gm-Gg: AYBFou1dUTEssMbs37eFRI8sMwlZh82t87DiHWd4WsFnntW9Ta7xnOrjFBlJnWMMTT+
	Ivl7KGIYcNhjGIEwd2VPS1KKckW1VGzXYjnfBOAkvyf2BPoGLi9PwVzt/D0nVxja3zUMWtQZqRM
	vpBUMlryUVRC8P41gi/NGS5B4yjCCf63Rw5VHy6ojL8Eb9remN+j2GAlAVPDFQ8WULLto77hwMh
	rU/xseEQm8UxFpkIbgmjH29xBY907cA9KBd/ItjP2rEWXGiZ452MM+Hz219YsTFs/8mW2HJ9wQO
	JJf3S1oATBYSpIk/beqWml3I5jhpqiYpenAdElvL9ZBiGDUJ5cOK5Sv28ELuqKPoZPGxk4bsXlW
	2o70HDAOucxpYKQta3UP/lnKq7II2xRDIDBkaoRLnjd8=
X-Received: by 2002:a17:90b:4c44:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-39aee0188bbmr14466436a91.11.1788403949357;
        Wed, 02 Sep 2026 19:52:29 -0700 (PDT)
X-Received: by 2002:a17:90b:4c44:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-39aee0188bbmr14466195a91.11.1788403946814;
        Wed, 02 Sep 2026 19:52:26 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143199692a6sm3164500c88.12.2026.09.02.19.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 19:52:26 -0700 (PDT)
Date: Thu, 3 Sep 2026 10:52:21 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: defconfig: Enable PMIC5 Gen3 ADC thermal
 monitor
Message-ID: <apjg5Ta-PatEeqC3@QCOM-aGQu4IUr3Y>
References: <20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com>
 <20260830-hamoa-sys-therm-v1-3-27108c40fba5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830-hamoa-sys-therm-v1-3-27108c40fba5@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDAyNCBTYWx0ZWRfXw9hbPpjLWqTD
 XRbVz0yv/HS7/TDustSKtE+8n0M7j7QDjMxSOykFSacsm6o32puUr/e8y3fjW0JDTn12ZBLM4+L
 +UDcWHXgkbkSxVJivNOCx+G9JUbqT2Q=
X-Authority-Analysis: v=2.4 cv=G+ss1dk5 c=1 sm=1 tr=0 ts=6a98e0ee cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Px1P4hqg9HuXTZj3O0wA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: FMMbCFDerGTdup3reDPzcmu4kRnCnK4d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDAyNCBTYWx0ZWRfXwAJyXAC7ILF/
 UAQloOBNN9JmvvUbqiSNrt1KluYq2lIYTBmpKSpbYqLmOMpU801LY/rJ9gBPme2niF1IUpNyivg
 NgwBtg2QeCW4jZWbvaJ3Ou4/VmlcDH5ZnF/ucrWaHPxtqNLPbA9V3Ml7+O8NWpCiNlzWzeB+5Bo
 KArQZQfPSJqKrnqk8tm3jkZWKTU1mM4VUEwZopFa22UevHICT7LPxPoKNJYQdwXDsvut3Gcmh2T
 mBvQ+vBl7cn79mgixi9E8ynEA4ZbTA5K1fIngOqeltpZYb3RZWz/Zz0k7TE0gaMUDZFE7BWny6C
 kUIv5IMm/hdc7IN0NdbzVacSS98wBmWeZlX9YKGTw2yIpLr5mtkI7lA8m6awnl8XRqAXCx1+6BC
 c5+qHBR46LqoA3KI7EAad6HKiyN101Ak2gGAMKW+j+bTTG4TwGf4l4bR+9Uzc9lrQwT6xyyfjBe
 aRMk0dRwgi6df4cIBTQ==
X-Proofpoint-ORIG-GUID: FMMbCFDerGTdup3reDPzcmu4kRnCnK4d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_06,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030024

On Sun, Aug 30, 2026 at 09:02:04PM +0000, Bjorn Andersson wrote:
> All Hamoa-based devices uses PMIC5 Gen3 ADC connected to thermistors for
> measuring temperature across the system.
> 
> Enable the Gen3 ADC, and it's associated ADC_TM auxiliary, drivers to
> enable these use cases.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

On Nord platform,

Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
