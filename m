Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333109;
	b=uEcoxpBThxJ+7hXRoHMq10pdpNgNacRGDQhAjadshEIJuRCWTBQeYdf8NIYGITeEXJ0M
	 oJCiL/sdMohabcyERqGUQQb8y1OFcPJJziK5SCgkv1aFMVNhLs66Nte1xzZUJkvVss+xu
	 VL7iFfyW6KsELSb1DbA8cM6L0NpEXGRAx3YExkUW0C1CXW+cRGkuHaMnwbTeR1jwhs1L7
	 la+PLkgaVzzeL45VjA1vpZzyopCpHgYZOTY/E+pQhnazqqOYyjJQMA5rki5yW7rlxXQg6
	 glJX/knUdrryX3FKHBRU8szZBH3LPzEU3hHirOFCdG1S4HCAqkpprpmt3gilRN/MMyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333109;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kWkhdha3nQ+YU6W68ji72ckaJYIXt+RZxT95aMd1MIY=;
	b=AjYY4xWiSzkoauC7ELBwDkazG9BF4Q/hdjIChi1nI0mOpqyc/BC112aQrxZmg1Z+/w70
	 MTsNCke7iWSXUhJQ3Ac2Bz5uwz3PMcFXepEFTTGhUW6/pHTCCvRYk+eWEm2lzky4MaQrl
	 VM7Xq/5XkQJbrfccGwzCZyrcDOWx42nAAx9kOQIFk9yRpX2U35fwQcet3cVatUg+laiiQ
	 tKiy9hjM6b2EGVY5kyN6m/TY/S1kP+vMk0txRyr4ZRsj70kLih6M2KXaowbKJ6IJvHy/o
	 I8Tfm3XuCq2jQ1Ole1Fwx9T3tT7S/RpYqZ9pscnaiyP9ty2slhY3NL/la7YuEyzUHfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k0VRE6+u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GicpfOIB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42432606A323
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 17:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42432606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k0VRE6+u;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GicpfOIB
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAExqvm2748219
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 17:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kWkhdha3nQ+YU6W68ji72ckaJYIXt+RZxT95aMd1MIY=; b=k0VRE6+ujr9qu2si
	19L7uwDIWPgQxjAmR8eJP2soTnbTuM5D6BQMVozfJbxQ0VQDoa7S1cka+tgxa09Y
	VdVu2XC0aAvTwfyA0hJuDbWyhS/bZ+Jcb8JWn1/LdU+d9j2nV5FVLl/g3kbRWfP6
	x4m1rNg7w9iDDTRbobz8MTLGVteEsM2zFce/SZRSOYugdSOyMaD5l9g4BcvJ41x8
	+MN95ZZsvY70KqIztZY5BnW2kLtnrHQ5VfYUJ1pImHrhMNRHaVi/2wcOv3Jk7F7f
	JQjFWqzCvAOb4Uk6avwkjcyZbRlkzGTZQTyE2ho+gxcD1LlOfrooT+FhiOX5NS1o
	yORTAw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyw4a2t5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 17:51:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-944101e6367so432850585a.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 09:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794333107; x=1794937907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kWkhdha3nQ+YU6W68ji72ckaJYIXt+RZxT95aMd1MIY=;
        b=GicpfOIBboq6NdMnCjdunDmggoAPlpd8aV4wH6CALQMTYAVKiIehBE5yKYUiBOQB4K
         VLNZZlpG8MlskpSVeabkNNSGG3ok1u/0EhXfSArcCFOK23GClq0zEIyu6KP+ijd3gS8G
         NrKmeNZzPES++wH310YC3F4nyo5IPagwWeiv3mmZnA9IcFwq9AOJ3V+3MLYPSLppvpso
         kZ6ZuCScfKc7Zwlkcfv8/mamH19S3f7m2xkNCb5p6nenbNyOKb1N/GbLwr6FLdG1ec+q
         FCd42zfWhbARg72aJG9bPnFdVCZXLP9/tyfVqj3pihiLp4PxBQYw+/aVzR2ypPjJ/Ss9
         x+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333107; x=1794937907;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kWkhdha3nQ+YU6W68ji72ckaJYIXt+RZxT95aMd1MIY=;
        b=wCp/tDCkNMX+Fqf31UQpJvXFqsLdC1ZeK7FhtYdqwqVrMcZ0JNgWe15goi6dJluCan
         EB7203r1tDpFMeHAgoJYd0Y8VEVzIcTjeWVi31TwsQbX0Sy/IauHf4XOCw6unCJdyiNl
         qdHrS6moTh6YYU24bQrIwsMaG97SpPPdjoIFnE+L/1wFrlH6uoGNl21pjv+4yU4G99ho
         f22U63r+ODzavnZm1UMU2Z7koXKLPOObuirTzM+lA6dBrqd7ZEp1o+GaxzwqOltRm3Dk
         jZWbjUnMT5IU44M+/SCtqj8crLJn5RxDLXrZ9p/VFCXDLbGUREAuE35dAEzX3ONuHY7e
         YFZQ==
X-Forwarded-Encrypted: i=1; AL+hErFVqIQhqwgknRLQY8n5NXjbaTVSsKAQMqGJtZNr+cvWYNvkFjBCS0eg7GIiHMEZS7yUgc/lGgUtm3Ng@vger.kernel.org
X-Gm-Message-State: APuU4Z/jdbC2Op+fNIayWEeoISf0jUjWG4dzz/LKjli7yiLIZCX75jQG
	ZOGuGg0Arc32A2rOMOYccT078tfsViEGpF/+sxOhyOZTVtMWCoKpTEEMGfhjXv2YJE3hn5RpaVT
	ad6a5ex7ibc5788c+onIndnFyytp2DD7i662SPvvmtTzltnoauek0VjGOApR+iXFoYgWWe75e
X-Gm-Gg: AYBFou06FFo2bRIzSceDYPfa4C8tSJ+5t27fBqC5JeZxSZ4x2AZzx4qOzlEn9VLIs4p
	KGhRsAFLwABmvzQVBKoHpGw3qTQn5prsv4rRGl7ehdXm+55u5q/JbsCzk3JiRiEVP+19+rIs/JA
	BK3LUCgYkvJLguvw6Yd3S9NPxrlV6prepVullxnCMk6HKveHwH6uFYOlR6nO1Px2jb/2C6jMP8r
	121BB8wiJvRRd8mME6ikw+1BmjjWsrAnddSbl4VQ0sqv2UYCc/Ad2wWGWgf3zhAOpL/PpGOgkqD
	2+R1vLn597CgrfF1ZzsTGtjIuB6pCf/sTmby0xkQSGHoBR7pB0K9vcHjki1bjh4GiCnWeMAkFyv
	6YyqvP3TXTtA9sTiusn8qS62Kx2/7fvNMy5kx7LB/cXhhsvIt9aBn0nrrH9HVZMqQaUwoQX8/8q
	sn
X-Received: by 2002:a05:620a:27d6:b0:945:fd9c:b26f with SMTP id af79cd13be357-947ae71efb8mr46541685a.2.1794333107460;
        Tue, 10 Nov 2026 09:51:47 -0800 (PST)
X-Received: by 2002:a05:620a:27d6:b0:945:fd9c:b26f with SMTP id af79cd13be357-947ae71efb8mr46534885a.2.1794333106894;
        Tue, 10 Nov 2026 09:51:46 -0800 (PST)
Received: from [10.216.48.249] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7578bcc7csm1415476a12.10.2026.11.10.09.51.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:51:46 -0800 (PST)
Message-ID: <3b00916b-d47f-4b37-8142-2d844993e7c4@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 23:21:33 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: remoteproc: qcom,shikra-pas: Add
 iommus constraints
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
 <20261104-shikra-el2-v4-2-97e7019debff@oss.qualcomm.com>
 <20261105-bold-seahorse-of-reputation-8db98f@quoll>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261105-bold-seahorse-of-reputation-8db98f@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfX6moWXhbsr55Y
 GBqxBwhPsXJ5ECwnSY2Pcj39p1LlWcxKOb0E0mGF5nNVxdq3CZj3s/k2xOvUZFbVhPqCR6VAwj1
 UWuwXUiEJZqaidB3hw9k9YH4mQqKrNIrFrw6o09V4tZhY5lDr73jOYfsw0IGtUR6ce5tfAR7P72
 p0dI09s1GWCqVc0iTKeECV78TgqZ7+vetmeyF9iqBIF65VHQne4U6kNShAE5Oo0l6VfwbiUYU23
 xlJoVtXZiMolQAz1U5C8gVvtfPkqP/Ofq3DC2ht74+CY/y226rfbJf2PO2D4lKTGbWMTnh9fng3
 cYf74OkepJ/x2KjkwlmnhPDYdKxxs/YDCcVIDXrlVtvgHb78Ikkucds6cTSn41Z3qHCoXno7KP8
 hmHTzty43poAGAHeZazY1X8ytyMVRrbgu5aa4H8Mmh8EVtXrgae1BpqP81CTLpkuVItkJd+rnVi
 viZdl9CmvAUVFicY1Jw==
X-Authority-Analysis: v=2.4 cv=Ee1d0/mC c=1 sm=1 tr=0 ts=6af359b4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=BJdym6yNp6BzvLZH3dgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfXzIezYUdyIeCN
 PbT153S0Do76+GmF3X6sm6I+CrYXVrkXH5rnMWS9UkpBAa9Qho/lQUe4YVWZUtZ7mQiBWMIYxLG
 SCah23IzzTHVnlnNACCk9lWfmwiRocg=
X-Proofpoint-GUID: tRP8j6HQXxEWmQFHphaFwM7w2FDT99jW
X-Proofpoint-ORIG-GUID: tRP8j6HQXxEWmQFHphaFwM7w2FDT99jW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100071




On 11/5/2026 7:06 PM, Krzysztof Kozlowski wrote:
> On Wed, Nov 04, 2026 at 07:33:31PM +0530, Komal Bajaj wrote:
>> Add iommus constraints for Shikra PAS compatible:
>> - qcom,shikra-cdsp-pas: maxItems: 1
>> - qcom,shikra-lpaicp-pas: minItems: 3, maxItems: 3
>>
>> CDSP uses single IOMMU stream, while LPAICP firmware uses three.
>> These are needed to describe the firmware streams when Linux boots
>> at EL2 without the hypervisor.
>>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
>> index 34a2f15e9361..8c8a7616d478 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
>> @@ -112,6 +112,8 @@ allOf:
>>             maxItems: 1
>>           firmware-name:
>>             maxItems: 1
>> +        iommus:
>> +          maxItems: 1
>>           power-domains:
>>             items:
>>               - description: CX power domain
>> @@ -134,6 +136,9 @@ allOf:
>>             minItems: 2
>>           firmware-name:
>>             minItems: 2
>> +        iommus:
>> +          minItems: 3
>> +          maxItems: 3
> You need to list the items.
>
> Why maxItems? What is the limit defined by top-level?

There is no limit from top-level now, since iommus is removed from 
qcom,pas-common.yaml and not declared at top level for Shikra.
I will list the items for qcom,shikra-lpaicp-pas, with one description 
per stream in next revision.

For the single-entry cases (qcom,shikra-cdsp-pas and sa8775p, sm8150 and 
sm8550 bindings), is `maxItems: 1` fine, or do you want a one-item list 
with description there as well?

Thanks
Komal

>
> Best regards,
> Krzysztof
>

