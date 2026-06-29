Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512C13A7F47
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782725302; cv=none; b=PObKDtJM8wKCiz0S/Fay/6gRNa7sJfM+Ghgyhpv8M2TWJwWT50Z2320jGgc/pe/w0nS/MREAygJ+sBs06i2FFV5Lh9VdgNWc2DXW09QpAJUkhVmArTBkuUQn6rauKDi+ObSS97cd/CrfarX8dljUWd6NuGA/k6KShdi5lTpBMxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782725302; c=relaxed/simple;
	bh=G1EUklChKiQ7C7somywmcjwpAJ57sBld+P+KNJZ4czQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=di/9VK8um839a0oTES5xjwIiwG4CX4yqkj1Uoje1gM3lbe3m08D0K20+SnuBHe1PIaV6V6VTGJHcymNqrV6J4BbiGsvQOT/rzgYSAkfHEpM7ChviHfvzeVvaPtO5tcx2w9/oHMDxbo1eMN0uIOS+vzcrQL/i/GEZk7aiQFa87Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gdVUrzwM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bwVUgtZ4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gdVUrzwM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bwVUgtZ4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T904762433806
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nEcPLKx1wWYryOLqYNcv4+ejFRpUuBS4O6Heh+SQc9Q=; b=gdVUrzwMgWkZgpbO
	oSCM/6FDeXyMCGfLfvJ+tbY3ATUknyQb14EcHBXP0ulcxeqOslCjtTAS/YkaOq+q
	iIt5BYpknSDnJMTqwBPbCKPszxrGjkGRlxg3P+z7NC1fcqd8Z8ovYh0QAQ12SLNw
	Z8w2pqQb4RNMCNwLxEL3lJ+gyqXGTDALoLmwXa6ZzEVA0LYhALb/vshfG0R2C62E
	MPQONhDJ4ZGDEOAR2ofYT4pZ4LrOLatBAzhjkETI+9z6rr7yMIgYOixmrnIeQNiZ
	84BuqpJNTNMhc79rGNZsLijCZRpMTE6AK8tLftYHKbCB+EI9cZTxqSu+jXx221XL
	GcXZWA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nper4gp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:28:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92b110673a6so57813885a.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 02:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782725299; x=1783330099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nEcPLKx1wWYryOLqYNcv4+ejFRpUuBS4O6Heh+SQc9Q=;
        b=bwVUgtZ4jwebyLeTqGJ85+rd7rEx/ojW8fLOh9HYYmR4iUSwxgXJa8ngG0c5ag8yQL
         kJlapckrDAstbUVigxk3TW6+7Abk41RX7gF+u0fWDSiGIHEV7se/Gjdk6qlX5Zd07hdq
         I3IiPYoEOwPTwHVefoxUOeyncxdjQcWG/5QtnZ1m1Xst+LnwYrAb6dkwDjKVzl6Ngucn
         yoHVsDP46smkxZOz+Uzl36JRMOOUZHuMRU+0RgU6s/+iOJQvcxDQUtTCLxABPtuL2cub
         m+wTpt1NZP+jrsblQBEyh2JlzAoNzfexdilJxvhuudRxHaDGFui8pwkqBicWnNd/vh0F
         /fsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782725299; x=1783330099;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nEcPLKx1wWYryOLqYNcv4+ejFRpUuBS4O6Heh+SQc9Q=;
        b=NX3N0FNX4m/xemQQc0eKmiS26ttxMubPkNjB6aUhu9cH5ZwaRwqbyfIdJCsplQX0Mb
         dhWFhdtvnGLlZMZcYN3WGCPtMxe6EkW09iDWnXYE4C8YyeM5iNOjoPYkDNm9OXjSeZ6G
         008CbTmTME6Wrl+Dth4MMCkfRTEEx9a/vPfvbxDPTKY1qN3YB2vXSJYFu8N6b5Y2yveh
         VebEhbl4LFuxj7G73FV/0H3vsTQkmPilcMnALGXQ/OW77TQ4AZTxO6vM7fDuzBlU+1gg
         M8xwyXlSEzZGG6OqtYQs/1bS1/Rl0ZULOcqsaZG4OGpLTYCbK6mVn/W2CZUHIzCmqQe5
         z13A==
X-Forwarded-Encrypted: i=1; AFNElJ82fdNePAg2/Jp3gVcX7hOOg74/sI4Ei0fL6pWL7eUQrBA9jR4+07mL4bkRLH1qYD7apV3lfxVhjW5H@vger.kernel.org
X-Gm-Message-State: AOJu0YwKBHKjO9GwaM5JuxrkpV5AJ10/qFQRbJDpJ+FZncpdHf6BhoK5
	Xk1VdLVxcsvjGJQsHEGNvJs503wEtmvGwFDZd8xqFe8GFMqidWeL1Ut8vJmG+i6y3a4yhZBBiCc
	bbwtEc1bBV/NsPHRdUGYT6ECHMdT0fd0zokD3WrMFjiU37w70dwr1PQPXSwibiLXQ
X-Gm-Gg: AfdE7cnkP6JDn7OF6v0r/QOVm9+M1QoPtZr0vJDgojxQWf53YiiaAp3JZAl3qJv84gp
	eGMgEbb++yrJ9lunu2C0qdcXs11sodMhiNjvqQx9wSxWQZNduOjshQOY0PIS+UcVBrpkQWzZXa1
	5ix73YhdhPtux4TXCNjc10A/R9jIRrXLeOQ3eCkLqCOEoijMaUmnzHQ6bDI9UaIPe39yfiP7nd9
	RsSKUla+NAX8ILFw7zTh4moMOqTCM1UrkL0YfZR/4IamGrwj2hgM7W/ScxV8rrq/NwL2sZOasWA
	ffEtiWEAwFb2GWnUJPDtalt4DOq4/w10es55d5bP4yTgM7JQwBj4m0B/4m0VWqMU9vuBzQhWCdp
	x+horF7LqWOZ1+p88josjuZOL8/fzmIpQYqo=
X-Received: by 2002:a05:620a:3f8f:b0:92e:5ba4:b841 with SMTP id af79cd13be357-92e5ba4d0e2mr41002585a.6.1782725299551;
        Mon, 29 Jun 2026 02:28:19 -0700 (PDT)
X-Received: by 2002:a05:620a:3f8f:b0:92e:5ba4:b841 with SMTP id af79cd13be357-92e5ba4d0e2mr41000285a.6.1782725299029;
        Mon, 29 Jun 2026 02:28:19 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12645b62e4sm153791666b.6.2026.06.29.02.28.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:28:18 -0700 (PDT)
Message-ID: <77dd2139-d687-4c6f-b082-df325bc4cd4d@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:28:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Introduce HONOR MagicBook Art 14 Snapdragon device
 tree
To: Konstantin Shabanov <mail@etehtsea.me>
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org
References: <2aed327e-abf6-401a-a05b-ba3f4a5cd7f3@oss.qualcomm.com>
 <20260628082005.40036-1-mail@etehtsea.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260628082005.40036-1-mail@etehtsea.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NiBTYWx0ZWRfX16YTQAlaS2Ay
 0e55lyUtUy0ONm/GOk7vA2wRjgsbUdkOlALEDXP7x1NS+2/zfs9vvtCgxYitc/p/WI0fYlEkcap
 5nAfiYSG/D+FVdH+tHHsuUxU33zfEvnz4Z2e7t1vhDufVL+GsagbbfnnFXqcT71qQtgMSqyeNf4
 T/s7yPn/WO4jruvB/68jZnHpCEw1YocU5AprnHhnPGVaJ7s2fqumMfgGp68z1nP0+gIYWvk//K9
 XYkPEzj+XjjUygthTVvLQ6keEnMuW680hJHoxvZpNgnK68CKPpsKCd55P7IXtQyG4Z6JG2371mn
 3o+7pSODJRfwTfSO7j+ixb23k6zY0BJJUPZ5ciN/mRYF7CJ6Uo8vV+7NqW1gobQ0Sf5JqEVuBOe
 aFsSrZJM/At6xMSdsMqBtzWZrGxAV5/Y5q4HPT/xwN/UD02oH4/VY/tKsrSOgH32vc7LdijoCN3
 0p37DRqbLGxQpnAZdtA==
X-Proofpoint-ORIG-GUID: WbDR1OrB53jM6xpK_e_LUewiGs0a0l2S
X-Authority-Analysis: v=2.4 cv=T6q8ifKQ c=1 sm=1 tr=0 ts=6a423ab4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=-hlgHtOIqNyq9T1fpdYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NiBTYWx0ZWRfX0GNZYPjgvzH4
 Are2r8iu89hOYbcEOVcsgTBRKJlfaKm19fjaKeVW7XRmcUF7FiOf97uH8wunC2YiUa28qLkSvAn
 +u92xosXwi/ZObhTwOOy1Qr7COgg4ZM=
X-Proofpoint-GUID: WbDR1OrB53jM6xpK_e_LUewiGs0a0l2S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290076

On 6/28/26 10:20 AM, Konstantin Shabanov wrote:
> On Wed, 24 Jun 2026 14:10:10 +0200, Konrad Dybcio wrote:
>>> +&iris {
>>> +	firmware-name = "qcom/x1e80100/HONOR/MRO-XXX/qcvss8380.mbn";
>>
>> Is that a model name, or a placeholder?
> Yes, this is a model name (Intel variant of this laptop has MRA-XXX [1]).

I'm a little surprised, but okay!

Konrad
