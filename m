Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6B03FF8B0
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 12:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787659979; cv=none; b=W+MjGsC8rPorPtLcdPEedR8c6F2XTXw4vZEHTRx5h2cZ/UZ9R0c12u0ULWP+79CBr9lAXCjO8YUzX8vRPi5PPHf3wmqJbW2TweIzvi9GJnGYdrbDNJ7KC0KP/A3gmkfHcMbclW0jiJOox2a93yL98pLCZcx+aUOzDDR8vkPw7hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787659979; c=relaxed/simple;
	bh=Zy/uplELbej2l31ZzUf+KHC+qlsRNpMsRObEQAmlf2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Szw5oPCec5hlKcItrK6gS3EMoO2Y+pP4gqL5mxSZDsULK7rmilVBPmYt/XpXisIfq7QBEZ6ENCDLPwWHZvB8hEL8X8yjuGkFODSEmR1iXJHppTjWpBwdnxNf1l1CgNTBf05x+iAL0/E7W6kS3bryoDqqQBWA4AY0Cp+nR5m4K0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=STOUkQyJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BRrv3QaN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="STOUkQyJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BRrv3QaN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PAuvKe2320805
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 12:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GFYBfDMFLN7EfoYr1yKrbGv2vHYSkMdELyDJzYvM8Ig=; b=STOUkQyJC7MwAcPo
	Lbed1T5mcuXzoWZ/nuwaFsLC6jSrjPmBAWI6RJh8b7LtXeUfHOhZRtsXfQxf9Vqp
	KCQNJJ1FKLH9Eq0r4aRYaAjEztgCNCPhurViedD2PdncOZeug+uuCiuBLlw1VUVH
	t1C/yMCkhhJVUPN8CkycbQvVo4tfB7wjqggy2VFEDxKNvB53bsInutWnIykI4G6l
	h+N/Sb+lc1ubOSbSrz7SeulJL61RzM9eRNMaX9i5rMxhcUIafUFJzw73JXVJUWf3
	MJh4L5jgK64xm9wNlWGMNkigYGmk6dmc7dofB1ZwJaPCAMRKzCqMvJeKwIMurqZ1
	BJjszQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g92jqt2dq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 12:12:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d04908139bso64264935ad.2
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787659976; x=1788264776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GFYBfDMFLN7EfoYr1yKrbGv2vHYSkMdELyDJzYvM8Ig=;
        b=BRrv3QaNeTjSo87ZDwyB5xp2VVjoiWYSLVb9cbx5nFH7E91zKSqMGZYR17cbrBSlVt
         QwVWmUGu+24nxdkXvk5kcHOzwKx+QOHXkdAMmDFWKiE+eeNpE6wehyYxvWMjm9ydNUqW
         c5wo5nv7t/rLLiHHGcy1/CFRRpRIk2PZ9MyI0UNA2YKb2HA1d6T7ZaO7mwL3ZpuW5Iu8
         OC+yUuY8S6WbjKQoKmcERkHJpCYefBem5oQOT/LdbT/w0QtB830ItWnBM67tt2p3G1f2
         wSStJd+DB/nF6/G7xZvcetQ5x/j2wSZVnVYgGOMv0PJ60SvLrOyeHn5QhJGjVl05/xNu
         1nXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787659976; x=1788264776;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFYBfDMFLN7EfoYr1yKrbGv2vHYSkMdELyDJzYvM8Ig=;
        b=aWMKlATJ/FSr6p9f/SMh/5jkGvnw/hoDIp/ZLkpqzeyUY74+kt4jIj2AP5qgK9giQ/
         I2jGN0T4wRKl3bc8ADEXzPk5YX4CmsTBKFK4schU4C2UTk9t+LEFih4j66APDVup5nZv
         Isd9MOZkepg4PdBElLEpvpMMKjM7kfePtQmzMrWCi5UeusxrXj56ZJg/Ri6D1jruLMI4
         RGfABYp5zMJbJg32mWlzgxL3cRYAbhSLVE+2BOTi+c8DCFkX6ap2mj3AVmu1GA3bYdn1
         OI0bFTRh8M/rFd91Xrdv0Q04p9NBoPgOz6b2VUdorga1AnDZwgAUZdA80Jv2SDnXEe8J
         /BbQ==
X-Forwarded-Encrypted: i=1; AHgh+RrQYkt6O1fAbrUB6oYSe6MuVg4kv24H+1H0wU7q5WQs43/rKE7f9TR1w7OWXPULz+jHOxOUFeg6yvxt@vger.kernel.org
X-Gm-Message-State: AFuF++kiU/+ykdzSDDhzQkUZ2RdJxlLnILHXkbqYLaCEiJuQIDsiRj62
	lXFeA69COSR/42A+3ok9DAx1l/+n6ueCvapTGFuchZbOnQvPT8UwWLeFUuwrM3vSYbNETygylJ+
	t/NIG2V8hrkKhl4pQVTE/F8dHHZVrowKNyPjfdEHa85+FpjJH44vQDnbG/WRITovD
X-Gm-Gg: AR+sD11qtqIjOB+gemdm36rppQ/x0y4KD/LwYYaYRIe1a0yM0Dt3VJmQxdT2OWip1c5
	7XxJIgQggCp5M+FjiMSpmhRcDpSnOzJn+CpxYwkIlIu9ZrGmQIGMPNnWq0qgZ4K6vKbmaYbSW0l
	PwPL2ulMpj3sDjFygkNw96x0BB+etfW+dLfZv38emOvFtELnOg1QiTJmrotQDaux+ZFuTqq3s0k
	VP81H2K8VoV4+BdalQ0rbvWFDg8elLEHxiHi3EBbo/5Wxqvslx+PwSrntzlZezZsaJi8NV4CyWw
	kll7BP2cwaPJuS5a9SxHM0YynY2YqEY7qOj/d29CyqXlaQLQxH4GJFAkcFpd6ZhVDak1unfJpZ5
	mw7Y/6VML4uw3gMnmHXiQb5t3m1gI7ko=
X-Received: by 2002:a17:902:fd8c:b0:2cc:864b:539 with SMTP id d9443c01a7336-2d64addb782mr652487125ad.6.1787659975989;
        Tue, 25 Aug 2026 05:12:55 -0700 (PDT)
X-Received: by 2002:a17:902:fd8c:b0:2cc:864b:539 with SMTP id d9443c01a7336-2d64addb782mr652486155ad.6.1787659975506;
        Tue, 25 Aug 2026 05:12:55 -0700 (PDT)
Received: from [192.168.1.16] ([106.222.229.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d6768d9241sm28068785ad.71.2026.08.25.05.12.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:12:55 -0700 (PDT)
Message-ID: <c9964dab-d396-497d-bb67-5e509fc8a085@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 17:42:47 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/9] arm64: dts: qcom: talos: Enable CDSP cooling
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-7-b15d47adc379@oss.qualcomm.com>
 <b471a134-397a-4f0a-9d79-1777ed067c54@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <b471a134-397a-4f0a-9d79-1777ed067c54@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: spF6myLFVtniz6usVr6Ew6G5dcOTrf_j
X-Proofpoint-ORIG-GUID: spF6myLFVtniz6usVr6Ew6G5dcOTrf_j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDEwMyBTYWx0ZWRfX8k0JsjYer2nK
 3kKlIjNo92CUmTVqyujSBMxJMS7kRxkEFwVELIKbT2+0BdUlqZcHp+QIDn4U/py8VLKD4WaqWy6
 pToMY7ObQHTXO3sEh9s21OZGYr2Zd/kvUWSIw2eiVaVeg3HNiGsvTh/3S8Qb6pD0tZARr3MMNBx
 EyGmRi6MsSGuneAwwqPPxsbpBaKv++m8zV9vLoiVbPuitKv7+aKEwQHYPGpneWPiaaVkeRf1QGO
 nrkUhfCKSdTM1X2eOmgRy1bNyoFZjxDTvCh5saG7W/OwZv1jZKYneoClbY3AABQRmn46m93Y9dx
 VxVKOcgrfNIpSPLc4JA2+OCpolLKroDL3Hzq/2UCH6fuNsTZWle+QhpWtmge9+HREQkh40Yn1cQ
 2q9/enusdt2vBfOYvui6s/TSlKQJjbKDZYe18k/fE6phbj9uAGDlUcyRLa2LKdr3CP16mlT0JPw
 BT2ZQ5BX9xm9O5FCPow==
X-Authority-Analysis: v=2.4 cv=JJULdcKb c=1 sm=1 tr=0 ts=6a8d86c8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=x3UvaR+l8cLCJ1uKBUlNag==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KkITgS1P2qNXoWSfFRAA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDEwMyBTYWx0ZWRfXzN8rA8IJYsE5
 4LyuEVFk6pDM10RCo2GJOH5Cqy1hmHIjPvQLtxO6SggSyha0t3TwnUomeNM51jVwJlxetxc2CWu
 gqSEvme/u21lJTZNmTbFYdzCx1yFJ0w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250103



On 8/24/2026 7:47 PM, Konrad Dybcio wrote:
> On 8/9/26 2:29 PM, Gaurav Kohli wrote:
>> Unlike the CPU, the CDSP does not throttle its speed automatically
>> when it reaches high temperatures in talos.
> 
> [...]
> 
>> +			cooling-maps {
>> +				map0 {
>> +					trip = <&q6_hvx_alert0>;
>> +					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
>> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +				};
>> +			};
>>   		};
>>   
>>   		mdm-core-thermal {
> 
> Should this sensor also be bound to the rproc?

Thanks for the review, Konrad.

Talos does not have a modem remoteproc device defined in the DTS, looks
like modem support is not present/disable for this target.

> 
> Konrad

