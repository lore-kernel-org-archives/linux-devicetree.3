Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04781FF7C7
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 06:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785737029; cv=none; b=PwghlG7tTlTlBlcbZwBvo0fpZ/DuEfddTIsIEKLukUmtwx5RO4p2zzGbWAE37KlckjMWZ5piTN4hKXK6cZaICv7cxrdU2p/NZ7E8H2EyCvT9k5q230gvVEFtQ/UriSUsw6RmUIOI3N+qoxDsCPSEeLOx/pkn6B7+vXd3NBIZs3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785737029; c=relaxed/simple;
	bh=NVKpyVtSiSWogk7+4Z1rtMjp4TUnvu6c9CDwJeyXwPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fNdv/yRt5gDq0K/UgIbrD+sBhqts/OR9TOpZI7+8hXSWaH5ixq6g5xfjl0YsXPkmZh9G9955w03M0Tjp/i77uf6QjblI01sB9245EPkcao+miaF7lX+ZcloX2IrzhsWvK0Bf/kuZnuDYiVAgGSPMk4CILzeWb5TV1fNTHbMLA6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ocHephfb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sk3X7K86; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ocHephfb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sk3X7K86"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LWTYk3301136
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 06:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LxmZdCMt4qSTVaBzkPA3F8EgNAmm2OMKDc8A5xMIYjQ=; b=ocHephfbPLSjY+3u
	JDJCRMzEvoxWCGLRMp8MRRifWfAJ3Y4pEajoIHs+ArNgnQTC9VqsSKgZWn0VCIK9
	hmxWal7g6QCHhXK38wN7MgXiGzZjjep9PhflHhlA75+9xfdbr7UpLqfJi9yrPh5i
	h0oIgGWkOlPeUUNMczqKVj97HMe3dMK9xWOMM6xJz5qI4lzuPo/nihdLgNe2dDjZ
	ETIDTcgSFPpBS3csFzTdMDINMbv66T086aHAg+InCICN5kCmN3yP5277hzR1DRe5
	hPU6us79L0r78CJeeilfr15x8gToQ1BuWtL0xlUYMI7NaoAdEzMWc4sscRLQEyw+
	wEy3Kg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8qpvqde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 06:03:47 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so3909105a12.1
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 23:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785737027; x=1786341827; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LxmZdCMt4qSTVaBzkPA3F8EgNAmm2OMKDc8A5xMIYjQ=;
        b=Sk3X7K86jHVb7gRjODUajOF+VDBCWp9sYhkVNp1WgwFkD4VSMSDcsIUgkvY1OgLm+c
         G/nWq/B/ncDxrZ64yUBGtljpV6WeYk82wluZlRyVcPV/Opl6PvB3w5oYUYxZo+Wghn+I
         IldGikGoEYs0uWbDPoML3mcRLf6gZRpCWRrTE1dnHR5XMC9UxdtKRBuagGu4R7YD8FoQ
         9J2SUKwVActv+U/+wemDDNiOXKJIGvNIITG82/QrfvFVJ8CZ/N+F9qagt+CCFIgbNYYf
         xR9veh0IF3NRcQIBl2PneGOntaCOwSRrL5pK+nGV8jgUQVUm9ooHhJz+j0l/VTw5ZsUI
         Cznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785737027; x=1786341827;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LxmZdCMt4qSTVaBzkPA3F8EgNAmm2OMKDc8A5xMIYjQ=;
        b=o5c+pYOAWBDRZKO5pJqoP6+VwMbLN6CAtJYc1Kmti5Xai7+Vh2VwprwjHYKx3iVNc9
         3/VWb43bA3ZAKrCnuH6fU79eKt2cRMmPkxEy0CaFdAp//Pb7f5tga2Nxb1mWd2jYmMOs
         nc+Jcsv7kROCP/pzJg3elCS3VA096pHrCH/bwHt3kwPvBjGGRwjxMbseSgocVMzDiS4z
         YX9Xvflzg084nzn0DTkuLpeYIYMm/BojN2DJ3aDLy3wEunxLO6110w3rsn4zGzSw6OCX
         FzU2E9nMvbW2KOnZ7TRj/niW7wOQQ+c5XSdJBzQrtv8z6HW5o3YF9O/HsVmI6v5BFfJD
         uzWg==
X-Forwarded-Encrypted: i=1; AHgh+RoQYqSbzhZ8YiBvMek5MPMdO3FLFz6CBtc8BFxe6rLpjVnI4ub/Z3D2UTN/huoz5ClxnQZyT5cYJ42V@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0SMUsFUXq2OCUJsllqfkeDn3UqIT2zJOV6rvHXfOpo+xcu7z0
	wmEvl48uJVc4+Xll6WbFOOIunV9MzVCEBeFWHDK94gF6BBOEjF+GGt0J+cQu5azPnnSZVgO4JiL
	3U3EKxAtMf/T1FZWuOfPWKG+KFuCt4vgklFLUuWyFVRf5UjS9qf6vbUHzjN4IIVjd
X-Gm-Gg: AR+sD10kWW1syDyzlDqNtOS/4osFydV0uO2y44JSDhYIX0vEHYD/8lq0nHwqomIMRAu
	+m91dRpHbk4dHl5sd9JVlW2KpX7qlpLHygH7AiB95cMPH9DpMY7cT/CMbDjx2VmYjjCoy0bKZtC
	5Y0EULzVpPcywuPvCQTyv52mEJHe9IAnzAVIHCPqRYezLpswz6CZKA4zbNfC9xThp+vwr7trQCK
	cmL1Hr+TaryxVO3y60mtPDQZ56dJg9dHvYmdqLB+FVm0aLHhQ7CaLZ04CgKgz+isav8J3BfQlWw
	Jdf/me16nruA/v57fskvS3dq64L6wYgp9ZbnNgHkwbrejaVb9Us/yKIAThk15miQmSys94Sjpkm
	736m5Y4wZVz4Idrqucg3ORpRvo+IHoyE+VBntb9sWvJGV9O41b7VOFZ3RBJJwCtK6fw==
X-Received: by 2002:a05:6a00:88c:b0:84e:2f2e:8c4b with SMTP id d2e1a72fcca58-84ee4844241mr8496790b3a.32.1785737027173;
        Sun, 02 Aug 2026 23:03:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:88c:b0:84e:2f2e:8c4b with SMTP id d2e1a72fcca58-84ee4844241mr8496765b3a.32.1785737026573;
        Sun, 02 Aug 2026 23:03:46 -0700 (PDT)
Received: from [10.133.33.126] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd35a76sm3148890b3a.6.2026.08.02.23.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 23:03:46 -0700 (PDT)
Message-ID: <1af31cdd-2e06-4373-887b-0ecc72d34d21@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 14:03:41 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: switch typec0 to PS8830
 retimer
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com, Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Milosz Wasilewski <milosz.wasilewski@oss.qualcomm.com>
References: <20260721074145.1534100-1-xin.liu@oss.qualcomm.com>
 <70349e4e-12d4-4cc4-91dd-9e5d45d3427b@oss.qualcomm.com>
From: Xin Liu <xin.liu@oss.qualcomm.com>
In-Reply-To: <70349e4e-12d4-4cc4-91dd-9e5d45d3427b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA1MSBTYWx0ZWRfX0+F+XyFeKcFF
 LsaEDY0YWkv+9N7+N6K2OjtUVN+zKpGT/nL//1y04R6OknFfF5aXTZ2xDs+Jn1Oa9pZrrCsPfuU
 levUiGtyNkxXXnBDbFD2TiHkObMgozGVTKSp5PJo9PZA49HNxqT+BXaZzmpZMPIM8lq+n1znqtz
 /2zxH2Vg0fUNBfMnsHWKKWWrLmXvChoiGwHnwjtzcXaumtjr52ROBkYBf3XPjd0EhhSHlhwSlQt
 IpaQLRbmTSmPij7VJaJLAhUpDZsg4RMJqigi5OejFH1ngAyFngANSLPpew6l+uCWcCGiYOBDg/V
 0d3yeIGPd8yflbjNZFNlkmiX1HW0b2JzHjx/Ee14UOKwFwtiiB/lp87PQfB/6pacROgbp08XojA
 u8UtVHuHi/2rpu422ziwXDHvSNEnkYav4YhSsZ8zfA192IL+2ntfZAwzm0xPBWMcW1O2jHJbB/t
 ksT8R0OhIztidn0vbcg==
X-Proofpoint-GUID: 7sXSHY1M3qR2FM8CaSIPjGzoiqkprylT
X-Authority-Analysis: v=2.4 cv=MpViLWae c=1 sm=1 tr=0 ts=6a702f43 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=iJ78zIDNj9ZIkR6p9HIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 7sXSHY1M3qR2FM8CaSIPjGzoiqkprylT
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA1MSBTYWx0ZWRfX54Pzth8lhnaJ
 nq5MGX4AfRBTHEuiRSdTEYQ/7Ym2UvFBM5O4tPr+Apf1w18dPWfnUGyEyw7on9xiAb1iF+Agto9
 8J97oQSdhXKGatfDLyid47cMJ8eQpzc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030051


On 7/21/2026 10:28 PM, Konrad Dybcio wrote:
> On 7/21/26 9:41 AM, Xin Liu wrote:
>> The Hamoa IoT EVK populates a Parade PS8830 retimer on I2C3 for the
>> TypeC 0 port to support USB3.0 and SBU muxing. Describe the PS8830 and
>> route typec0 through it.
>>
>> The vreg_rtmr0_* rails provisioned for a retimer were already defined
>> but previously wired to nowhere. They are now consumed by the PS8830,
>> so drop the "Left unused" comment.
>>
>> The FSUSB42 SBU mux chip won't be populated on the final EVK
>> board, so remove the fsusb42 node and its pinctrl group.
> Are we sure about that? I inquired about this on a pre-release
> version of an equivalent patch and never got an answer. For sure
> there are a number of boards without a retimer, including in our CI
> (+CC Miłosz)..
>
> Konrad
Hi, Konrad

FSUSB42 is still present on the board but with all signal lines 
unconnected. It has also been confirmed that all CI test machines are 
using PS8833, not FSUSB42.

Xin
