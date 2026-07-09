Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F8F3EBF13
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 09:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587735; cv=none; b=XZ454WfI2o4O6/reYKiWUE6Ce0zCBV7BKA8erQE1rkYH8M2nBtzMjA6dRUEBpvwFNGQFdZLyWPe9xrAn8msakAq2g+n8dahd8lgK+e89IumvYVF/EfePH95aTd/+cf9LJz+z9KjLoDjbcRI1wBy/QpiIgYdyxyd8jkPDnVkDWUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587735; c=relaxed/simple;
	bh=wA81xsBNTy6unQfj6IY1O6fqGPGEKdjYscAzKj9ls0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i47sB143wdHCF0LBd5BmdTSqFp7BaQN9jPNqt944uwGWqS/9/pYBs2Y2XJrNtMarnODCVxv1lWTbUw7AyVhg43fWzryepu5pS4rYAneyIQOrklF9XrLAkSwqQ21PLWa16hZhvhi8M97uBHuEOh+tZEn8uy0clK56Q4xezkNA6ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AulfuAlm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CAjt51Pp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AulfuAlm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CAjt51Pp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6695xxWJ793755
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 09:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EOoqpkxalQnGgn2rNAM92KHFKF9kGa/rlb46Hia6Qak=; b=AulfuAlmG2nMc/yj
	QmLRWmYJZcbVBduUxmvmp/+QQOfbcw1XNli9D1qps4BTCWRJV+YgY+Z6/tA7Swpl
	YZdtE0exoFj6K8e+VJ1sfaEFl7/M4plsnVAvPX4Yoll8azBclSgTe1K7Zbp9h4Sa
	ztEjjJkSwy0Uxdx7NxiJqgZFvFPeW/49I2iy4ycArnnVmwQN9hGf+9HKy7VHEfaO
	DkdP5XTNJ/SRuEERvwY3TdRWwvKCF3r5aS+CPCbJcE/Y/KztnemFrKM9pALTWyVM
	332VS3PU2dYPIoDjpnFc/bqMpAkS2Ibh/DWKWciZQlb7HhAmpWh9Wr3EKt0iATwE
	MOHVcA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1ydsq0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 09:02:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3810960140eso3213085a91.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 02:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783587733; x=1784192533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EOoqpkxalQnGgn2rNAM92KHFKF9kGa/rlb46Hia6Qak=;
        b=CAjt51PpFLsFB6/7TjVdjaW1296gHIFXOMOwdlUCl8VoNmE+dcUV8b4+naVEg75zk7
         ZZBuo/C/VD5PpF9iya4+TJEjhYv7YQ9kfUo9HskhP6u12kG3mPDIW7dFFqCqUHlAbh5Y
         LHgEno3ivy9n+ZbfGfzX6SrndDZMz2566+qxfGmV3z2EYG+3sPDD37MmKODH3fg+ulZW
         RlJ8K44lILfRo+5ud7HCn387bqMCPt8k3XXvO2DqGf1VHeYhTFm4xzrYraLtmyzVS4Hm
         ddPq7pqJBtXO7VnolUJxMwuZs3Vx2xWYuc2Sg/TpHUWPcdSC0c95qgQCHVlOviRsewGu
         ++iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783587733; x=1784192533;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOoqpkxalQnGgn2rNAM92KHFKF9kGa/rlb46Hia6Qak=;
        b=o16ocJXH+8GfUopioLA+fkmy3waMUBMKTOuIGHUmMcn2sj9UsHVcefgH4VPkhE1v8a
         fKurAl9HwYi/znDe7RKMLBi3Um+wYQ0sl+Ht5b1f11EqSxl3sb452JwKxfGCXNrS1qK8
         EuPcU6tW3hu1A/taD4AOPMPorMgVJs7OT/jLIynkkWAudBPWQ00zrORo9xGamjstfFdH
         Lo9RIdBK8Os6hUEbwY0eagHEKCfY/aKFJCWX1y5a77xObkIwfkayFe/qYWW70oi0UPkB
         nHlczJ5O0A1DPVO1mCHgW5jsVqfqt7WW8y72ZGUZPEqFJ1w9Uppk3TIftmYAFIEXe/oC
         6/Pw==
X-Forwarded-Encrypted: i=1; AHgh+RrS9n1wiN3GXcS3Ek/uh76D4CuPXKVasoWwGEqx/F2ggjE3o8e2PUzsgxmMbxRak2jgb9HAYcqaEoIu@vger.kernel.org
X-Gm-Message-State: AOJu0YymzEBueFVByJ49woVRDyH1JuQYzcj0GIRw9NoXTDM2+dIXKOI6
	t3t//4AiMtKnZVi9Pn62lhqf9WZj9Z/8b5GVLnTdwbCTMP+5veVvnnQYpPRZ1mP+JY/gg6vQwpA
	sVqioaHzyZb1nmVu+HNMz30RyqrG9QfecHC3nf5TcQa5hXAU3+o5spuAZOGHSdz0B
X-Gm-Gg: AfdE7ckI2nNwV6Z2IJ7A8rQs0t6Qz8KRvVSZ1jwF7rUPn5qCgn/OTAA9gMgAZzxPnFu
	mXt2gY/tSBXZ4OZvdFadP4lwxKQGvBArvmDmVU2dtUknooPIe+yG9IljMXal5PnjiGqD7T3s/CB
	OAVLi7vAG0Gr6VhXc82nBCPTAWsnWwjiZaRcOY9HENLYct+/OjhyWZ0hvxJsvOFZkipbwSiJDzq
	NUEjJ4KO6D3mBuK+9Z5G19fy6HGIoBL7EhrN8KUkKfZMakYNy+Z9dtKObb5w1mcBPOzk4fp7nrq
	9IZmUfoj6DOpW6VYoxr6ojcSkyjwxSxC61SuStx9hPW/ZXkOstdRHzkAm2AY+x52rS9K2JV2ili
	oQB01y8fd0fSYyh7Tok5gujskfIsEe4PCYprHh8700wdp7sYTFuxGadXtiPxXTt0jJL4Ri139H9
	O8
X-Received: by 2002:a17:90a:d2d0:b0:36d:689a:cb27 with SMTP id 98e67ed59e1d1-38941cc7844mr6222191a91.24.1783587732733;
        Thu, 09 Jul 2026 02:02:12 -0700 (PDT)
X-Received: by 2002:a17:90a:d2d0:b0:36d:689a:cb27 with SMTP id 98e67ed59e1d1-38941cc7844mr6222140a91.24.1783587732151;
        Thu, 09 Jul 2026 02:02:12 -0700 (PDT)
Received: from [10.133.33.179] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a57dc53a0sm823440a91.9.2026.07.09.02.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 02:02:10 -0700 (PDT)
Message-ID: <c120ec84-c125-4dec-945a-da12624d82e7@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 17:02:04 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] dt-bindings: arm: coresight-tnoc: Drop
 arm,primecell to bind on platform bus
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
 <20260707-fix-tracenoc-probe-issue-v5-1-bf733ed9ebd0@oss.qualcomm.com>
 <20260709-versed-marvellous-pigeon-22e2ba@quoll>
 <e5876525-4568-43bd-8c91-6dc462b18fa3@oss.qualcomm.com>
 <02baada9-3f87-4e60-a469-44af5ebe1afe@kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <02baada9-3f87-4e60-a469-44af5ebe1afe@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4NSBTYWx0ZWRfXzMnIrkBG6rPI
 h3eyrMmz0czjfM1AVOsWbWY2iZkY53lE/ATUT19rRqF7VTx/yIyJSJqcNRrmDbZEjFt06ua6cdY
 Jj3H1Zl4oDMqQv527tk0k6jxNMw/IjA=
X-Proofpoint-ORIG-GUID: -s9DswlOS61A0eahT_WWpUPbpObHw3wa
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4f6395 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Zyal9cr7WW2U8Oh0dT0A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: -s9DswlOS61A0eahT_WWpUPbpObHw3wa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4NSBTYWx0ZWRfX2GoVZ1L/NcOv
 cvDU9e9f4x6v9nJiaH6m99BjPmm+A9CcLY+4KnBVFtyqb360vk/NzBRDA4hV3l0LD0SX7aDlDsl
 /86U3uYDagq8QPw0ZMqvOboMfwBvd8lc5xUNYwnUBV2IhSw5D66PWQ5siWT1of9JxGYkKWDIc1Q
 OlBCtAxqB3aYd9vA+IXAQlz4UYVNwW5nUPDs1FrGEjXluzCn7mT5xG6tzNYwFUF13G6lceVT7+f
 waJaIzcVtG9fgvK3oMcbdkmBe3140lXQXTUOwd0ExVpw29+SfU7rTR7E4iGWThPtLktIgEIZYs0
 KMrmIKp45wrYVkdW+guO5WKhfIgtgVUC2eruh3SKJbpLXgoC1O9R1tcfNEL/EHTh2W3YhzUhdS+
 wlaMCIquVhQ1RuEzPPNp+tmbhFFZIWWhptHdakFcDtv2icTAEqb6+d5P+IabARZGFp+OexSITVb
 DnV+NireMWDjigy1JLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090085



On 7/9/2026 4:46 PM, Krzysztof Kozlowski wrote:
> On 09/07/2026 10:34, Jie Gan wrote:
>>
>>
>> On 7/9/2026 3:59 PM, Krzysztof Kozlowski wrote:
>>> On Tue, Jul 07, 2026 at 05:08:49PM +0800, Jie Gan wrote:
>>>> The TNOC compatible previously required the two-string AMBA form
>>>> "qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
>>>> AMBA bus.
>>>>
>>>> Change the compatible to a single "qcom,coresight-tnoc" string with no
>>>> "arm,primecell" entry, so the device is created on the platform bus and
>>>> bound by the platform driver through its compatible string.
>>>
>>> I asked already: this is not a valid reason. References to Linux
>>> structures are not correct here. If this is your reason, then answer is:
>>> fix drivers, by renaming or doing whatever is necessary to platform bus
>>> to behave like amba bus.
>>
>> The issue is that we are not allowed to introduce a DT property to
>> bypass the AMBA bus validation, which reads the Component ID (CID)
> 
> It is the first time "bypass the AMBU bus validation" appears in this
> patch. You do not see that as a problem?
> 
> Again, third time and the last: describe the actual hardware and the
> actual problem coming from the hardware.

Understood, will focus on describe the hardware and the hardware issue.

Commit message description updated like below:

The Aggregator TraceNoC hardware exposes CID registers, but the 
Component ID value read from those registers is 0 instead of a valid 
AMBA Component ID. As a result, the device cannot be identified by the 
AMBA bus and is not discovered as an AMBA device.

Since the hardware does not provide a valid AMBA identification, 
describe the Aggregator TraceNoC using a dedicated compatible string and 
bind it to the existing platform driver.

Thanks,
Jie

> 
> Best regards,
> Krzysztof

