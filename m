Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5402ECE91
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781100928; cv=none; b=kH59ZnqRC4SVzOyqs1ygXiqS5uFteRknJKPHjaW+xOfWTOsp/jSd/DJQbLISomeZ3Hqjn7CSkXFxDehSl3LNdFosnkZ+bhJc1L42qRKpsdYSqe6a1pbOPNWgiusKq8lxyyM0TKs9Txxb7lEX8uED0rn4mCR1YelY8kVm+sZczBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781100928; c=relaxed/simple;
	bh=MFXOZCdPBc0TVsd4Y2UVkvn+uoJb2263Pchu6fl3G0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XqDBEU2AXMHi0C8pQ1SaR92vrX8+5t4oCQTGqU2jod0wBB2D7xdWFuupCYhYrne7tUPCEw6+DwQzTmD7ss2Mm/JiSwft1LUCyB/Cd8/1KCUL6IbV2DM/0MqofD+f3Q9pSOL1ANK08EDRdJor7ELspYJHFm2jiaQdcsMJhOQrNK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a6qg9sbM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FT2hiE7I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a6qg9sbM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FT2hiE7I"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBw731169956
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UzmvbhO3ccLAFDnidWjn0AfYFzvf4Vav9+7SbxX5aQg=; b=a6qg9sbM49qI90pw
	IajAfxYbrHXzoHWl05FBcfEy0O9Fj/r8+2r7WxjlzP7v6A8EVsmAy2oMZ5pUuSf+
	p4OFEywRpVdVGc3oE7w0Wl4IEzl5ys5cSJtsm6Vo7rL/t2tNc8pPQj4c5VQEEqnk
	7YU7pSOLi7y4fxGC0Hyb5MkWIzktHIl8MQWJMmAedKs5xRVDuoXaLLx5ptRpregt
	nZLGKzwQabtpKgusyZD16C53Azom27trOWeETj+zoOVTkYL6jY4iUX7wmAL3S5NI
	Efbvq301aWIo67blgCfb0NXVAFgUEPeQS/WBWXFylwhZgGAdaOXgVe+CnDUeIJ8A
	ok78wA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq4w1s623-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:15:26 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-96388871d70so6169590241.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781100926; x=1781705726; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UzmvbhO3ccLAFDnidWjn0AfYFzvf4Vav9+7SbxX5aQg=;
        b=FT2hiE7IHhLq74SM4xmI6jQGSWHAphb3tueGkwRXNEDYmVB6MiBQVWcQWYivuDD8GZ
         bk4pyimS135eTAvjvkmpJGz4hHt/WA8ZwKQ4cNJGk3OxjLmZxnoysdrY9RC4bl3bf8Sc
         ZNGEqfAcK+hEpnlxrkwZGMcXPhhnyZXF4r5X5Dbzfq1CS6eXapqehAg6YvgMrHmz34uN
         3NvzPb4xkVwNOh1wSSngKxOZBfQ7YxJMi5RfLRDZYOabaX0Vq/4G3RHyBksS/wYPnxxR
         LtDw9Sq5W5U4Uit/7CbGcLVt7HxFLz5xyEOP/DjFWNtuU543MdTdh2WXoAItd7s7kzTO
         NTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781100926; x=1781705726;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UzmvbhO3ccLAFDnidWjn0AfYFzvf4Vav9+7SbxX5aQg=;
        b=Mdfrmgy3yHjfVBfY99e1AMa3j6pXgQ6g28pM50syfUNmgb78KkVWq1PcnQubbJ1ntp
         xtng7v+xO16GWdYRWmMqKX3f9p9EJOKpBItppvkDe7N/aETJn32m7dGV7tauJFwklVyH
         tx3YR7aA469M/YaGqSlffxfVScLaT/KDz980D27JM8H4+YBqhykArzODznRTN7QQcHY+
         TE2H3A7KHLar+DSyu/Td5rtNaecZHssf5UujIkvqMBCRHH/o2dKwyQXQeEEoCMYIbr/c
         d8+XgxUPevSfGAUEVjQcLMmLRkIYOzaxCNV3ms7IqRk/WlHQB13qsYcWuVv3VxbV450q
         E9hg==
X-Forwarded-Encrypted: i=1; AFNElJ+8xzYI7CwQPcabAZZ/ONNMqMu6+eUb+l20KoXvu9b+BpygAfuQ1x+0wvj5w8YXLhqYikD53zQr9N23@vger.kernel.org
X-Gm-Message-State: AOJu0YxxjWvgyjJPNBoh1tSbxQasgATG9/bpNa56vFIG/rrc0uIzXmL1
	wd5mkHQJrrdQFOt/+rDn7I5GQH5OdThKBqlPEbZXm5tWaulhwItSArU+f8rdqDgV96LjlE4Vpnt
	LF8FXgmamyljSJsz65ccQJNpgUIhpqGLecV9GE217XJEngRjwYcXuORI9leFPX/RS
X-Gm-Gg: Acq92OEq2nGzHGg9+p+5p4TUANoT5oYmuvLukl7kZCIb6KBakKCY5NcN1FkRPUTJdCd
	vLyRuy5L9n6osC4LFVG1BYhLPN9zy4/u5apCr4dPk8YV7hWNqC3HXkV46j/4W053+Nl9r2/3hpV
	mPznFsDByXj/VBDfkN3umVH9yvCH1YR/hKozj1COp+ZSxjbu3Bb8GtMXAc3oz8gSMdzb1gFwVZU
	nx44LDwQ0PnPaDGJ3xODx6mLHiwV8vVbh1Rw9O97JpNbLHWGEn0rdoivOFVA+O9xx8X6U52nGhD
	zSS9mx+5IqeeE2KXE3v9/nE4EWfM/SGn5yAkgV+Y99VxH8VCjZL4zM+Ya22NYK6JGM6DCCTgESn
	lJBKGOg7LsNBnDjKdLWWyq2HGcyAUomkCTbSTodUGcz40vn/uMx2JAArUpiD1+N75wLFiM1j+Iq
	ygkmZFKiN8YehWrz23NzY=
X-Received: by 2002:a05:6102:6890:b0:631:ff40:22b2 with SMTP id ada2fe7eead31-6fefa60e40emr15357913137.2.1781100925751;
        Wed, 10 Jun 2026 07:15:25 -0700 (PDT)
X-Received: by 2002:a05:6102:6890:b0:631:ff40:22b2 with SMTP id ada2fe7eead31-6fefa60e40emr15357838137.2.1781100925377;
        Wed, 10 Jun 2026 07:15:25 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7f50:81e3:bfef:b418? ([2a05:6e02:1041:c10:7f50:81e3:bfef:b418])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcbe3sm67240484f8f.8.2026.06.10.07.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 07:15:24 -0700 (PDT)
Message-ID: <5105b5d0-16d2-44d7-9c9b-b6e982d7d53c@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 16:15:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] soc: qcom: Add support for QMI TMD cooling devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Casey Connolly <casey.connolly@linaro.org>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-2-291a2ff4c634@oss.qualcomm.com>
 <pyt62qpa75nzdatp5xl7vcqrdzmrzsf5ethw6wq62bzg6b7qtv@ts2v53im4bos>
 <33fe758a-a733-4f27-8824-3dff398e1cd3@oss.qualcomm.com>
 <awmoxzmrgqzot5yfwpoml2olntpultuguuvdfvk5mt2lxqjxqj@n3tsmix64fdb>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <awmoxzmrgqzot5yfwpoml2olntpultuguuvdfvk5mt2lxqjxqj@n3tsmix64fdb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: w_MFOck_KdpD6MoVnJO3sX89uxXOGmLG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzNSBTYWx0ZWRfX0EZ9O+6Uh7n9
 OCHkxRQ1Ma6LPZkeRsgXd2EuPkczhvbWPOduIItr+mWTxF2xPYq4ZZOCnKG/wQo4mTEbZm1aXY/
 aFm5SnX4UDotzvoqkk64/sM9pdVSSR0yhBtrkc7T7wSbOu6oWFcmvgTfCIbXo+ENjcxiL84E2Ks
 uYal0cX6bhglThyLIVgGwVAq9XVVIuwUidRINwIjwLZsboUVeDXBikQHlMEjC0Jv5SUSYGuUbn+
 q/cJSVq4Qj4TigLBW30wU8TFLXqxmFsjw5VcDEanN7nlCo+U9yD7+260fVCVaufekmlRKby0sZp
 HUVjsOv9i6rre/AQtUT3oH+dBsm2qenLKCJg+OS9a9cdCQNAQpFLXiIF4WYb2Rt3W0Q09nZbTS/
 0kui5i1wLnKbx6avrdmVoGOr/YZZf5QHNGl9YfmrlopSvUnr8vv4kfUr4aX6nDL5szGdtlBupaD
 vp9Y10/ZWJ+tr56JDDA==
X-Proofpoint-GUID: w_MFOck_KdpD6MoVnJO3sX89uxXOGmLG
X-Authority-Analysis: v=2.4 cv=ZfEt8MVA c=1 sm=1 tr=0 ts=6a29717e cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=duYTza_KgoU2j0Zg4FYA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100135

On 6/10/26 15:42, Dmitry Baryshkov wrote:
> On Tue, Jun 09, 2026 at 02:08:57PM +0200, Daniel Lezcano wrote:
>> On 6/9/26 13:30, Dmitry Baryshkov wrote:
>>> On Tue, Jun 09, 2026 at 03:52:57PM +0530, Gaurav Kohli wrote:
>>>> From: Casey Connolly <casey.connolly@linaro.org>
>>>>
>>>> Add a Qualcomm QMI Thermal Mitigation Device (TMD) to support thermal
>>>> cooling devices backed by remote subsystems.
>>>>
>>>> On several Qualcomm platforms, remote processors (for example modem and
>>>> CDSP) expose thermal mitigation controls through the TMD QMI service.
>>>> Client drivers need a way to discover that service, map DT thermal
>>>> mitigation endpoints to cooling devices, and forward cooling state
>>>> updates to the remote subsystem.
>>>>
>>>> Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>>> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
>>>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>>>
>>> Wrong SoB chain.
>>
>> I think Gaurav wanted to reflect the changes did a back and forth between
>> us, so I ended up in the delivery path somehow. I guess adding
>> Co-developped-by should fix the SoB but won't reflect Gaurav and Casey did
>> actually most of the work. So I'm fine if we remove my SoB to fix the chain
> 
> Anyway, Gaurav's SoB should be the last one (and it should be preceeded
> by the CdB tag)

Ah yes, right :)
