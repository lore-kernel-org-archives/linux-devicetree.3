Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF062FBE
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221826; cv=none; b=OcR3GY9Fbw9+OVrBEWRqnOzdZM63PWE6viTVZGIHBUUC4+3gq9f4R1GeoanQDPMqciKRnjEdbsjiOoyB076vjeEfxgAYljWFxbZJsHI77cNBuB9tT4pP1Qr7QkPIkoRmVUrEFSypMrBkPudRzHRoCRho36vvonDOeO3bHwEnlJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221826; c=relaxed/simple;
	bh=HPv9hQ1X4Qdl0VjYTO2v3OjAX3zC8AUQvrpeQ27AzV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uNSRLfbcZGjqc+eIAMpG1jAmgpbx/u92zfbRF0YAOFAWGdlxxSiSNhvx+6ZQTiXDKEXrHExBFwS0wec+N0OGiKg44VhXxLI/aiRA8QMe8ZwkmhkQv3DWp5RQmu1CRIsNh+8pMFMNKQfNbEvDfroYhbRPwO0zMOJZlxbcVlAdsAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nmGKHPvJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KKBNI9M2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nmGKHPvJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KKBNI9M2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6eZAI2161130
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=; b=nmGKHPvJbxBy/+YN
	ozJ5AYQXNor4QW1W8gJXLQHRVFH6riIBE7a07H2Hz2mqH2NxVBL78Sufwk7HWTrT
	DKkHhyFXYsd1sf5niq3jB6JG6kRN/gx/3jQsFFyh/yI06eyQX3/PrAQNU+XheLJg
	viirKLSyg4Ji9EWLx7S9sb4Zjkaqy6BLMeiOZXyDdD7V0reh5NRTkaZSeGEbTQkT
	IjD9Ks30trE72Pthcs5v918DzfSth/6/elKb2KvBk5mZeKXAhsSuBTiQmUvZ9e4C
	cFP9qQaDkkSfj30OmNBCZcpEkXS/i44QHdlFs8Cto2QMxCfLJPL/FhHr8iM7qqY7
	j0bSpA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vh7ruy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:30:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51e9d892f0dso1437501cf.2
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 03:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787221824; x=1787826624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=;
        b=KKBNI9M2HD/MSRyLpDAd26XUVSkGwbjwdbeHyO1mURjGkPQVaaPrzMwA9wWvAgtisJ
         EIG7dk+tKJYjtWgJV5jMVgvLLrreLiC25Ms5PhrfwyWHS2tjwaG1QTXA850JOndcVLWD
         Drw7Ympxf6v7+LWMMfeDVwT7arDgqFsqE/TcndwC2XVesN3KUDMqP+uV+GbsBFZpsbpt
         IwRvjEFj5J4N4ZTERCgtAspq6p9szTTNXySVUTNDiGDVeIwfpoNmB/3Fbv4enMhZK7rM
         2F0L4droKZmYR5G3VmAThjHEjq26vN+o3SIgctbZeLWDv6Xp3kMzDbuBkgzyNulVKUA2
         4bZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221824; x=1787826624;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=;
        b=JZq1GJkkNgGCsijqYCsC8yQ/AvPjikhfHjxW7w5VN/UDRj1et67SJ206TFtWaYWbFj
         x2GeoWMF2KIKddxv6bPYJR7bMJHKg55kbcHgfsOBdtvJnzkm6J8rQYXQAKXu4P+UgVpL
         DcIFVHrXgvqq0s2F9NNUdswNAeyHn8K25Fzw33XRZt7ksropcOYmSMr/GTv1ArdbyXSp
         i8tz3WFBoDijwI9eHB7Aa3fO98lipEawIWiBZ6iTfdrl6krNHm9Ykzl/IalbFuzLH0q3
         tTnEkKpZGihhbyr9qRmBFQYydzwcsmg+nBgXGS6CPzNjjFfufhBd/ipKvbC19NSy/0+f
         3JDA==
X-Forwarded-Encrypted: i=1; AHgh+RqxQvTkgS6J23y4JeCkvd0/S1/sWSXsK/gTQAZ9hTrpTyVcYGk/UAmPYwbeNzTkZx5BahXAxyOPhYCS@vger.kernel.org
X-Gm-Message-State: AOJu0YzLxIg/rrAU9U6Hg0UGfq7NC4YOeDrWgoYmmYSFfZFqqaB5buew
	N8gjO1I+EKVUZXKu+IRHFoTiK+xB2ss3hda3WzbD+NHUYUaWCd6SP1iCmN9rl+BXGz2fx2+bOlP
	IhQNr8X4KUr9bUIqQTFi+v4m9evvNebGLzBUmdWZ69YZ0LdHMBDjKQ3mqf9bff2+F
X-Gm-Gg: AR+sD12YOjNUDlFid8DjSXvlGpp4C6/zQ23iTo74BJDYwzDi2UgUU5Kld8ZTl3t+gp3
	kIAmkBCD+4+wg9mXUMJtbF+D00AGUq3QIb3w8tdH1oQUQ2Z7IRC9U2BmMozNLod5X2Je4kNAivd
	nUn4qMtPDoAuNpCs3ykbgQ9yN72tuC5LReiX38exm6NN4tiFnnPQOEGYCPVsC5IWp3A5GA1yc2m
	LUJI29HrVzlfYQs82D04I1MSOZdjYmSW05HrH2HNBRmwq8ddwCUybOFB2ACgQ90vjNGyrcpAhop
	VKJKbh4fWGbBa0qgrnm/ienDfLO4jRwsDetnEew6JygQoyjOjwzI5x63abhZmz39jkSs1k/SXLN
	K589qkWCqq2wxIWISD6m+Q2Vk
X-Received: by 2002:a05:620a:708a:b0:92e:5ef1:9072 with SMTP id af79cd13be357-9371e6a9beemr814873985a.2.1787221824007;
        Thu, 20 Aug 2026 03:30:24 -0700 (PDT)
X-Received: by 2002:a05:620a:708a:b0:92e:5ef1:9072 with SMTP id af79cd13be357-9371e6a9beemr814868985a.2.1787221823486;
        Thu, 20 Aug 2026 03:30:23 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b0b00esm52770466b.23.2026.08.20.03.30.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:30:22 -0700 (PDT)
Message-ID: <0cba8a85-85ea-4648-b80b-fe52e6531733@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 12:30:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/16] clk: qcom: gcc-qcs615: Tie the CX power domain
 to controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
 <20260820-qcom-tie-cx-to-gcc-v2-8-e67ea30d8b7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-8-e67ea30d8b7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfXxxUFIKdopv/M
 Lxk4wUvQU5Fi2+/X6//xh7S10rwRfUhzYLRS8OeBq/gl+5h13wv3zA1p3vq6Hk3L2Sj1lq1j+HZ
 TXxW7my0LWgvIe+rvknk5j01QmEgQB6VKCul3f9CLcLFsz6G75/fAxKQVW2/YudoWihW0A5giJo
 wsn1CW2u7blBzKa4zu28sChccL37fxzjWTQdKtRgdlKFJ4Zt6uNd2+UQQNYfGiW+U6LNHJrDv90
 4xYVQmaQ9SVY9WP7xM/aB5kxYeZfs1iInj0Xh4zimtY+qUeDaMJJ58sNEX5yxQFdiW4FsqusG5g
 syrqzh8ww5iW1iq2rZhz0bWbjScz6lXdh22xwQ4Bd7LeyoAuagEr8m9oYtowu/XhDRPG3zktH7F
 xidhTvN+aK19lotPT0EKKGUEnHCwas/Akn4VOo47pGk3wsfHuwtwm3m4AkQJaca+hmL8hhkGDyu
 YoZu5vDVqIYzw3balMg==
X-Proofpoint-ORIG-GUID: 9x5jq91zbOW5AK1-AlHeTj76iTeNHdwE
X-Authority-Analysis: v=2.4 cv=Y7fIdBeN c=1 sm=1 tr=0 ts=6a86d741 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=8AEooqP_IvclZvvwVwIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfX4QPtXmf0Rpox
 AJGl0W8whzfmOvuMj9H1iZ0XRX9SgjrSj4AL5zoqhlJxoq+On38P2Ls+ETbv6dJrv625oX/wfMv
 IfDN7hw8kP/Hg2Rfi48ynkVR2FsZM7U=
X-Proofpoint-GUID: 9x5jq91zbOW5AK1-AlHeTj76iTeNHdwE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200077

On 8/20/26 12:07 PM, Abel Vesa wrote:
> Enable runtime PM for the controller, allowing CX to be powered down
> once all GCC consumers have released their clocks and GDSCs.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
