Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECCC41E6CE
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230403; cv=none; b=jef/FDanUUxhHzqYeGs2TAYnI39KIYRMXR4WZNofQMUio/oMxC2Af0C1KxK++jI4P5uilKJup1jgqypEowBMml0ucZsIn0vhNiIJ+CE7gWs5pNU8RfhCdqqP038cEvS0QeaNnaB0iZBZgSUyiGkSxoe1PG5480ZCQl/WSSUSaWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230403; c=relaxed/simple;
	bh=YeAz3ZiVICsPGo9HW945ctSIDY2E/S3Xka08U3kOzks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f/pOG4u2NogKxK9hut81GsXZ4DC51q5EGX62+GL0Is6YmvORkWxeW117Beub49VxRJJHXf++pqx6Go/X/rzY8jzbB0R+l+NTqNnxUQgOz2lzx1Qw2n8p1CE0Am0KJ/NvJOYrYsI0+cOvU+8abPu6x+bep37Cp+WQISjjLL5lXC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8tyKFmA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dYNv46FB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8tyKFmA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dYNv46FB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82HZR2128873
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:20:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VEi+hgqnlSwLcW8Ov2RLcJR0aePKOCpokuohN+ezecY=; b=Y8tyKFmA69KeOo0i
	nyr/7QZBR195o9tkJq9836onogJpj9y/aTuOqyML6JdJteb0oUcOPGnD4dI/AT3g
	8a7WOsCudM/w6jeDDlJ8bpXntgRAEKzUUamSI4eglpa6OfmMobVgjC1vj0rm4xvc
	izmUedJ1LK4CrUUnHHQgpt6EnMLJWSnohUmp9ZUq5o9S+X1zGGzMK7V14jQBxgQZ
	SKGbRewBZZH5GRaGJWSNmZJRQ/gvTHwlhyf0BdpeLY0qcYyJ1EgVDh27aU6kweEA
	o2to/zi52QJH+DWjsOcAYbEuMAGGc85kOpO4Hw1he3J5Wd+IAL4C9IEXbbiL/lq+
	lWd2LA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbn8bebn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:20:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c9d953b71so5023931cf.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 02:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785230400; x=1785835200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VEi+hgqnlSwLcW8Ov2RLcJR0aePKOCpokuohN+ezecY=;
        b=dYNv46FB9ZSJR3itCDs2UMZKDmI9v/O2mccMFC0bTRRSX38fpAd4y2a0wfi13U0xjh
         m0K+rdl5LKQWchd0cYZfv2Sf9ecYm1qE69400oRQqL9ZWo4NkSSdYPmWOC5N5E13jgYC
         dtmHeRTpwr4jaZjzKjT37onB77Vf/YMZBl9LMh3Xm6sJhJe4uC5+0CU2ZIdQWfGog4cN
         gs9Panodxs8uz5s7CHZ57fc5Fjac3dOEhejKtXc1MA5IrmJGVMiLMvGRHBajrUc0DR6a
         E6nHmRB35icoBgVvxDQoVUctrPo9vJ50fYhMJrSlp2nnEEKJDxCojXNUSzVJnJ0ppyD+
         t3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785230400; x=1785835200;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VEi+hgqnlSwLcW8Ov2RLcJR0aePKOCpokuohN+ezecY=;
        b=Sb7Ta396j62+ltAghLdt/0VcZr96iRgVeNwv/5Dh6KaK1P8s2YHRj6jmY2tubo7mwD
         P4urAbQi8QQ4dpqmt3yZvhzntaJgUrjOq0vRs5qTXVRW6ETNyogEGlNGVOc91UnxaY+U
         1EOA1Lr4kxVuO83GO46hHKUHSdQoqDqtnfGKOaI0QRz7vE4w2XTlrXq7n63gKJFPelBc
         LACYquxT0ZE+BIXbAeFmKWdadxH5RsD2FZmNL79DZFfh7LRcR60eOUYcDW03sTyFWZ0s
         dkdOS0jyWl0eTVpf2YVH73p98FFLes6VBaSLhjlUWKQl9AEBuiUmOtGcvyLuVm123Cf5
         t3Tw==
X-Forwarded-Encrypted: i=1; AHgh+RoUIkHiPq7Ye7rhyrdAk3/WI3Bjd2RqZvik8d+Fd7jVCF0jzLHLZpGR4nsVOSX7t1mPfUNKuqcFkS1K@vger.kernel.org
X-Gm-Message-State: AOJu0YxK70BWdNebjeu5LH6P0I6QuU1XYa7AtKD9Op05p4jgeIavdKj/
	XoSdm1mPFoK1EnXBmYfLJwNr1LnUqb/wkEsjqYwC1+x6nZtMAxPYyPYqpRValQKYAfug2/uwmes
	5honOczgXePA2ogD3e27ijMOg2yIjbI67z79LeENSimDZW98tN5K6QOXrp850iSfDuo7VUnNp
X-Gm-Gg: AR+sD11F5GdujGPmg7fxGl2cy1sjbxz7i4e97kYp23wdT84x/V5EZgV+EUPP/rzSxal
	/cIpYK7nURjrXe3+XFSmUcG4qoRiyDuXhpJfTZcVtZzuzqGViCINk1XPqimn5jRUb8AGAU4B34j
	r64ebfjFzPmYRgxKRV82H+W5saK0umrtpmz3Zwn/S5t7h+JVCvQBvoOOcaRGmAebnXMbRM/X0go
	nPG0bre4s5fgmleMOXdAnDcP0vKwbD3i322evIe1QGzzGz2lPEyiYMwqHJyrZ35IIh5aHTkA3HT
	5hZDhG0/78xLaq/yHVJFpBHPnH/lCmJGxKiegx6sBM7DsgJikuExi8+XDvD3G+tJ1RKrxo7cInZ
	Y+4vjr3ukCM0n66rjq3KmIVi9
X-Received: by 2002:a05:622a:58cc:b0:51a:d45e:638d with SMTP id d75a77b69052e-529d72160f5mr9344771cf.8.1785230400066;
        Tue, 28 Jul 2026 02:20:00 -0700 (PDT)
X-Received: by 2002:a05:622a:58cc:b0:51a:d45e:638d with SMTP id d75a77b69052e-529d72160f5mr9344611cf.8.1785230399590;
        Tue, 28 Jul 2026 02:19:59 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebcc4dsm751829166b.49.2026.07.28.02.19.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 02:19:58 -0700 (PDT)
Message-ID: <2a66d7a8-91e6-4aa0-a650-b951fb5fafba@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 11:19:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] remoteproc: qcom: pas: Add Nord ADSP and CDSP
 support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260728084012.685036-1-shengchao.guo@oss.qualcomm.com>
 <20260728084012.685036-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260728084012.685036-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4MCBTYWx0ZWRfXz52eKB1pbWBs
 BCpH97rKONn3boIf+wHsBaaldREla2/oZO0EoaLN9E4hM+l6ST6I76k6hNqNQLkuTCaEfMOTK3g
 mvV57Vb2N7To7GdH6f3W3M61Yp7aidH7v9nbLx0GLBsIzJIqqQphzPmM9CPy4zM2b1GefD0IDWD
 em6pJnvAHwfThrw2FrdHVv3/nJ+o3j8tyqwg/rYISERyyaAXaQ/4zLO7y7TYdsK3SwadKHuUDx/
 aXJr2FBa5dRitZynRxC4pTzLeAcgDTz4uh3XzN6rn0lkCEzfGwL5Xqx1YbpWMBl9WJ64VnYWbbE
 UQi2lQ0un69uQ3UA3iZqJ/eCGQFFigWEc+g3MPdQtgg043Ba+ZEldgIF9JFHsHvdxCFj/qLDdJ0
 wklYNPZE7+/3hJ/TBtmJlBElvMKd1ig7p62N7oyx4TDXo8KThmQdIPxtll/G8KvoV9FJdyqZfdX
 kbfPGfHIT2WBfbFe29g==
X-Authority-Analysis: v=2.4 cv=RO+D2Yi+ c=1 sm=1 tr=0 ts=6a687440 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3a8ZAtU5bMRv0GgPHFoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: SVkLixVig0vKsoboO2_3UgjSQWeFSK9d
X-Proofpoint-GUID: SVkLixVig0vKsoboO2_3UgjSQWeFSK9d
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4MCBTYWx0ZWRfX6502xBqxImQV
 Gpb+g3MHAnaySFFE7wf3EdYFyOAgV+J4KuYRO1rPthKEfSeP4LiyVGihR83upUrgWrk9YLTL1/x
 DM+eDEJXeUy9AOYXY7rR8Gg72fYrI2A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280080

On 7/28/26 10:40 AM, Shawn Guo wrote:
> Add support for ADSP (HPASS DSP) and 4 CDSPs found on Nord SoC. The ADSP
> is pre-booted by XBL before Linux starts, so set early_boot flag for
> attach path rather than a cold boot sequence.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

> +static const struct qcom_pas_data nord_adsp_resource = {
> +	.crash_reason_smem = 423,
> +	.firmware_name = "adsp.mdt",

Please use .mbn everywhere

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
