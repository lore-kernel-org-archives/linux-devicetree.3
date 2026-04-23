Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59E3363C4B
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 08:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776931634; cv=none; b=K3DCwhJ0Ipv3DSdWMlRJmKwRiynXt9R6KgR1Cu9eDD24DXdB6+IT3lfKGjIuNnyWNNuxN94lP+qjIcifXhT66npLBJw0SzjuAq7YLmF9ubroL+wKKmW/uYq6Q254L6gagnhyr5ITMv0UfOPL6CkKHYQM1Qq1LybqoRySQpp3ZUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776931634; c=relaxed/simple;
	bh=9+0W2VWdwc2cB9MzpKPzLqvQtBRd88DboztIZvW7wcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YrUlBoOZPo/qDi/0dUpkGlcd67mwisnsCnFIUd4lzMWWYFoSQPXBQGzEpwNHcxR9hbZXVFsmKBuFDA+GYuyxhCS9o7u+Rd2tTLYUHA10eDUz1OVGkDqBuJ7cXlSoJFOtkp1X8O2nVvNWlfAEeYSwh4KPEdleYt+IH7fr3PJS2K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ogLZ41lT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vlv74BbY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ogLZ41lT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vlv74BbY"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N3YWsT1587801
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 08:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5cA4KLyFriM7ec4/EYZtlcwbpyBshVV3+QDW2hRa3qk=; b=ogLZ41lTaJKrurR0
	LMjZ7doJ63U2gowFEBxYYJC1DtJphoGHOdgmLh7yyncX41fP374tLPyAfH+el4JK
	WtSzbM/mGa5NRX/dE28zlfqPupu62h2WvBa0SxpDqtHnriwrTJWsDEijVCWINHGR
	WWCRiq/V0wHBnuD1wMhOdekBOZ1ebglFSkgPNYRoPiw84FzHHiCChdcR26NYud4s
	GvG8aGEHxRYhVum8JYomLllzOlNCVxi4AznlEj7xjz2DHn9mZswI+pKu4/kxqhir
	ypuXg0RU6hWfQ8cSxy7FL6Ysh9A7GjSP2RQpx6jvyLc1aWLH4DDPc/hxI+se2ICv
	dQ6TaQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1hq2tpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 08:07:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2d0c1ead1so119242935ad.0
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 01:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776931632; x=1777536432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5cA4KLyFriM7ec4/EYZtlcwbpyBshVV3+QDW2hRa3qk=;
        b=Vlv74BbY4QdkTODBnb4e7ta2bz8Td8Gd8D4eKHrzaA0/C6MS+s4X5Y8XR7zeBsIWu7
         TXeSOF01VBvEroXQIII0GYK+toyFgnSlbnhMW+nTKLmNIZ1GXqkJrvPAdhmSzBSxPTG1
         tuEkj1o4WqWRQU8zBK1aYfDYIl7/6mj4Q9+kyTCIttCAW6+2TpktO/Qwt4DcIVs9+3eZ
         JZftFpwTIn962QF8/KivkMakahY1tnsgBaznaxSzKX65v7Cgfw+wu7ZnvW58E9JEVzHC
         5Kc1W6dPODWWNags0r/CvzOUnXOYHcN0I2wExxR/3LGn7+3SUzK4rhRpyMRooBUvjA29
         RDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776931632; x=1777536432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5cA4KLyFriM7ec4/EYZtlcwbpyBshVV3+QDW2hRa3qk=;
        b=s1QYh0zi0IlP2SJYlrpGqQyoRixRWdS1fSx7w9kBI0tjOW3+VW62oUXUDfXBtUz+GO
         OYzRVjhNYRm1xJGwWuL3f7FhOiksIaNlMvNz82r8Kga/fG3RxS00VSeyve9jbymb2yns
         JN7gJWaCNM/MlcZ2MHSJmtFqS7F4+84Lso+JxDvMkLkzjeCyoasWOwiVXxiJwsC1J9dW
         8P75ypbYtN//fNkNPoyihNRsgXvHQbRj+jPXJ3QwFBaAED3ONxu0DtB1XQBwf3JmIwI+
         Ip4elTWozl5uhIKFnGi7cR7lRcuTRw417K7ZlGmrm+s0iVVCf0IW5cx3ysq1sNIQYPLD
         y28w==
X-Forwarded-Encrypted: i=1; AFNElJ/g3BhUSfwpHvab4ctoqe2YVnUetM1w/DBGfgOxnyiSTlSs109pnZZE2RJmjWvV0RPDJklNvcpoWiqf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy43tFw5fHdRQAgEMZ7DUsLeEh20DKL1HKVHGz9A7uyFC8/krxH
	+aosRxhYzcG7H5gvcPIzD3V2fW0h33ThRsmjWSIrBU5BmbjnzGZFH+CuyRoCc9JMHD0WE2Ipkzg
	If7wk4WFrkF+WfAJ8f/vPVHQMDAwYAfTrrOv25tZJMajXkZIDg5pLS44frzfM4ePb
X-Gm-Gg: AeBDiesfTr/54eN7jHhR2er9tVp6zNKDwJy5RMgANgVxNkw+unymCfa3rwK47AT9pDY
	6xrvzR9a7Ps0Dn703sbrewFliYE6e5kMJbY72TIG5SR249Lsr/7KVMyjXXkeuSlVN/prSA/UTo6
	p0GNDYFIHrBDR6Z5Cuz+m+xoNNXWn6011f455H3gIxwL+FSOlGqpjdxT1ru7GWz4LsGGbw/6yZt
	m/HXxKy398XAq57f21sCvYYM9X5kt6cS/wJI1xxoX+gGrsCGdnPDeexQsi6ipbVSNW6R1EHHeyA
	oWUD+DD00z4L0bbKRyYwArno8PbCVUiSWkSSPJtpV+QYE/IBefYzTpahtnik4o+9fTZiJq6IsAS
	pUjw3AXYtKLaqEOr6zzNFoZ1+lZOYWgQ9LXXyFoHcQSyUBMswWHYhsVx+3z38
X-Received: by 2002:a17:902:9a4a:b0:2b2:4eec:9806 with SMTP id d9443c01a7336-2b5f9e78234mr194281325ad.8.1776931631560;
        Thu, 23 Apr 2026 01:07:11 -0700 (PDT)
X-Received: by 2002:a17:902:9a4a:b0:2b2:4eec:9806 with SMTP id d9443c01a7336-2b5f9e78234mr194281025ad.8.1776931631021;
        Thu, 23 Apr 2026 01:07:11 -0700 (PDT)
Received: from [10.218.10.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab30f29sm185133235ad.68.2026.04.23.01.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 01:07:10 -0700 (PDT)
Message-ID: <6e8f523f-7ad4-4472-aca8-118de81223e7@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 13:37:06 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Enable retimer on USB0
 port
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        stable@vger.kernel.org
References: <20260422093924.2976069-1-prashanth.k@oss.qualcomm.com>
 <6c2c5fd6-c032-4658-9a15-039c77074c4b@oss.qualcomm.com>
 <8cb5e28c-1c6e-450e-855b-32491ee73885@oss.qualcomm.com>
 <3d50f17c-060a-4a1d-b539-1bea9b3e6cd0@oss.qualcomm.com>
 <79926b02-a892-4e59-b794-e8534136fe07@oss.qualcomm.com>
 <efa2da27-79d3-4cbe-ba3c-2446c6252058@oss.qualcomm.com>
 <hctf2vexnfd2lbnggvoanm424rmpzadg6daqq4477audy6mu2e@nwyp3ijbhay3>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <hctf2vexnfd2lbnggvoanm424rmpzadg6daqq4477audy6mu2e@nwyp3ijbhay3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA3NyBTYWx0ZWRfX5xivQ1cJT+Un
 0PJAoTNq69JWT6c+sMiCQUbWMxrHZ/7yf3n0KA1kXZU52l9IuFlsu6SYWi7xAiZruyTfdxDwwxM
 BUVbsuHyr4Id3XNarzGUt7Vn83T2y/sUyYIxF0qVxp6C56+Ia+FdCmVSJeosHUFVoB9wzbuXPYt
 DvrJSmc0j7/n/G5x3yWpS9OcfDIMvVSaNVeV5I9TLNMWxzV94SgRe83IDHWbrGS46Y6sL1juwo5
 NnEWl91QPRtsX3UEoWpEYUUC4Po3rj9/Sc8KUNCt2HWLVAP1J/9I6OtF3cOHcWk8uit9WzHOZ9c
 +DZpV0sVbPxhSJV8pR7riq7lnVK+JoMvunM19Ru7bTpMVVZRKDgwowp6mXb9QKY+NWH16bRInaa
 +J/fP95cdctP4OTge0iZmV4D1Oy6toEkkjcH4JhtDJKwpRXdMFSZa25Mcqvwbim7jaKaUHRYTyx
 Iv+azHZsYxkIcG3995g==
X-Proofpoint-ORIG-GUID: LUVS2rJUH24uyRmsR2FuPi0VRFnSirsi
X-Proofpoint-GUID: LUVS2rJUH24uyRmsR2FuPi0VRFnSirsi
X-Authority-Analysis: v=2.4 cv=TJt1jVla c=1 sm=1 tr=0 ts=69e9d330 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=BqLQL_UPtuLX997o1IYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230077



On 4/22/2026 5:22 PM, Dmitry Baryshkov wrote:
> On Wed, Apr 22, 2026 at 01:09:22PM +0200, Konrad Dybcio wrote:
>> On 4/22/26 1:04 PM, Prashanth K wrote:
>>>
>>>
>>> On 4/22/2026 4:13 PM, Konrad Dybcio wrote:
>>>> On 4/22/26 12:32 PM, Prashanth K wrote:
>>>>>
>>>>>
>>>>> On 4/22/2026 3:56 PM, Konrad Dybcio wrote:
>>>>>> On 4/22/26 11:39 AM, Prashanth K wrote:
>>>>>>> Add the retimer for usb_1_ss0 port (USB0), in order to enable
>>>>>>> super-speed enumeration on that port.
>>>>>>>
>>>>>>> Fixes: c11645afb0e2 ("arm64: dts: qcom: Add base HAMOA-IOT-EVK board")
>>>>>>> Cc: stable@vger.kernel.org
>>>>>>
>>>>>> This is a feature addition, not a fix
>>>>>>
>>>>>> [...]
>>>>>>
>>>>> Sure.
>>>>>>> +		ports {
>>>>>>> +			#address-cells = <1>;
>>>>>>> +			#size-cells = <0>;
>>>>>>> +
>>>>>>> +			port@0 {
>>>>>>> +				reg = <0>;
>>>>>>> +
>>>>>>> +				retimer_ss0_ss_out: endpoint {
>>>>>>> +					remote-endpoint = <&pmic_glink_ss0_ss_in>;
>>>>>>> +				};
>>>>>>> +			};
>>>>>>> +
>>>>>>> +			port@1 {
>>>>>>> +				reg = <1>;
>>>>>>> +
>>>>>>> +				retimer_ss0_ss_in: endpoint {
>>>>>>> +					remote-endpoint = <&usb_1_ss0_qmpphy_out>;
>>>>>>> +				};
>>>>>>> +			};
>>>>>>> +
>>>>>>
>>>>>> Stray \n, but you should really have a @2 port here as well.
>>>>>>
>>>>>> Konrad
>>>>> Can we ad port@2 and leave it empty?
>>>>
>>>> Why would you? Just connect it to port2 of the connector under pmic-glink
>>>>
>>>> Konrad
>>>
>>> Because the port@2 of pmic-glink (pmic_glink_ss0_sbu) is already
>>> connected to usb-1-ss0-sbu-mux (onn,fsusb42). This is different compared
>>> to other connectors.
>>
>> Are both the SBU mux and the Parade retimer present on board?
>>
>> The former is redundant since the retimer already has a superset of its
>> functionality, so that sounds rather odd.
> 
> fsusb42 might be also used to switch SBU lines for other purposes (e.g.
> for the debug).
> 
I just checked, fsusb42 is not present in evk, not sure why it was added
in the first place. Will link the retimer port@2 with pmic-glink.

Regards,
Prashanth K
