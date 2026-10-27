Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106273;
	b=CyAEdsqx5qQgZJvnVjJFC3eZ1ZTLqROcZl2AGYz4AWP2OU80ApQ0SyIb7ssN4Ps3pZSf
	 MhpNw+JaLkmImsh8xyizuEpq6VN18/G4UuVH8DpPCk2q1r7sbOAadhG3bkQcS3tFVLVca
	 fI1RU1oo0CmYs8QuoYbODL1DVt1VOLHnD76KFxZ9sm3/N7KiOuJljb/ht257krAWv7ktX
	 yqZ7Ps2uYBUn4LgfdDbo4MpC8VzlVmJFlsC+MTMdnC7RAL+yC4B8KIZHeC1VEBpc6ei2z
	 t7XlBuPnPrN3cJgHyoMWlUu1vrqt6dJmur2h4Q7lD+pMQNSXB5GFdSUo0MBWeEkp7Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106273;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=20sAaBtek/W6uwYCnGF7PYPD9AnfU5r554thWYjEZOI=;
	b=TSO6LuQ0qZkuqO9/2OFmlC7gdswP7WdqV2inS2G3UbGASL7Re179HaGvkbS7q1AahFjg
	 2/dmuOP5BR4kG0XDUrkHZ7+xf4Cx1kuZu4qQTXPWRt5i2VFs4m0HrJplu9Vm/CLrc5hXS
	 y3j5l6LD0mW7AojNMlaKkblSwSU2FdZu9ELUhR+mlENmfqozcRA5qvUU9Zru6z27r7vXO
	 5v67KfsRfye2zJn/6lT/xmCFsDO+666JfHuOWWe5xjE6ZPKi5U6Ih13ZJp5OsEJbXiAh3
	 xcZyz1j/wiKE7oVZpWzCj1Rx6Ph1BmL3kZHKOEM8VSgQts9Tb5mf7DE7AvAbQS+tsgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CzoEnh2f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BD8liUP1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064A3606A321
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 13:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 064A3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CzoEnh2f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BD8liUP1
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RCO7dU1124837
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 13:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	20sAaBtek/W6uwYCnGF7PYPD9AnfU5r554thWYjEZOI=; b=CzoEnh2fY3FWxv+S
	mTyVyGZt1JOg+PzIKup5Pv1txj9hnaELLI7UhW9atQHV1vRzQpmfQLCNyDl7dYRP
	2v6JkzqfmnHdJeCvEx0z3H/FdXaEoMfMiNotmlzWH9X+qWYvb9WMgBVrW4J8QjZL
	4cMteuqeRrUT1wPg79EoKsmR1JgrDdG/Ug22wxT1Z9Ms7RbZ5LvSHaN73atvd8q0
	MHQJzNkFICLfmxuIvfkGmjNCHjdPDQGxERMeqAcexn60WWlqZwj41RQzLW6U2LR7
	ok5WyZsHvE5huQFUHISRqYwmnPF/kPH4y/kENR8N9A50S9oICFsvIxPg93V7xHUt
	2unGSA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjux984ty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 13:04:30 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eaabe26601so253969e0c.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 06:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793106270; x=1793711070; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=20sAaBtek/W6uwYCnGF7PYPD9AnfU5r554thWYjEZOI=;
        b=BD8liUP1HYEvR60U6DRxz3FSP6rt4asjLuyFsoZfJI+dSHGYuA+jP3dkZTZr7E0AXs
         CFVA6dkq+F4yQkCLfzI6Qc+ykNgSDfhLDnvO6utVg/w64pDbZKIbeV55VIdf7fPFhgjF
         O5+MzmmjRVYmTDMPASXkGjoWZNWFerSPHroB2RFKZzfwJrractCnjsV8hAgUdgnpdeJw
         63KxNslt2FEyLgXb5WYb8aYoPkSqvEEUhIVGjQNyCJghO/5OEK16pVsho6B0MObZgvxq
         JsEzqUZiqITCFeRMQftUtyBb3h+NoqaM9R24Ne8yZab0Vuq9SwEAEmNGJXcr80ZhMdEL
         k4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793106270; x=1793711070;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=20sAaBtek/W6uwYCnGF7PYPD9AnfU5r554thWYjEZOI=;
        b=qCGal+JEffnGxvDk8IBf15XNusdj7wUNDRP3zxJgpkZ2C6SnWU7qV1VDGy6XuHXqbm
         fazatOqsldgnNQTw1oOQzoeMnoptu/3FCxnwOiVFZM8RlNr/OqRqA2+VTrMgefarYzt5
         N64LQHdv55WtViWf0B6Av4KXRX31GXn/Rr3gADuX28oWsiOAEAB2xGSyTzHyJtMmXsmo
         x7NTRcKZwSLwTiUBBMP5wVcD2dFpT0UFARw9VHLXfPNVEdhtuP8Awi/kDdfl+IGJAxrh
         /ShCcPb5M3tfpbl9LtS7redfJsD2t79i2U9NeR7Y3ISoweTwdZP6d3O/pTbkuZc6K4+s
         KVyg==
X-Forwarded-Encrypted: i=1; AKwUvBxFi28IPDXRjT79MOHqDHSikl6dIadpqyG87sHUQN69AXCpBY/TfIA0tioanQ5GcmOVgHEiURhqqDGS@vger.kernel.org
X-Gm-Message-State: AFq9FYLixnaBb22awxNTa7+LxfeLukga3RWe2vJ6f5+e1+J56lFx3f/n
	B1E7oKoKctvhfbkOJUOkoP9fa248Ypa1SyHcdZScAxiGmRMAX6MNPeWxoIAg0x2d5khX7t1ENOB
	QRmnko5/nhaGn9gLU/krPQpkecYUaC6zFCkKi6+9tobe1ErsqPWo84wQq02Bwfk6I
X-Gm-Gg: AYBFou0C4oYBwNEv76cFVH76ebCcfL2NEK9JKRatwgJZ6CTawFOfp1P4sEetgdjnOnD
	dk4v9wbmEuCmf3g8KtKUm7pCAItILHcOGGYMxUOERadaWeGOMnesqgJJjo4LlYvYn641tTJkLg0
	OlqE4pe4WJwqZ6YvLknhKeIchw5QnL/yuCcNktJ50KG449fKYcF5TYsZAt8/a9/e2Gv6nwqdeo6
	AjOTrniyw0YWtcY4nfo8kx60znyJ8VauEDUcurNNm6r4jVZPEEEBgYcyPfv+C/LS5SE06bGUfta
	OPql4ijwaXL0LLVNzRBsSXPP7KJUK0/nUApVApD0NQLaYxYLIiW4ltZ0TADMMvvTU1T+c9lMyIi
	3MJD90okP+AHpznfQYrZSiA==
X-Received: by 2002:a05:6122:c2da:10b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ec23230f38mr3698463e0c.3.1793106269984;
        Tue, 27 Oct 2026 06:04:29 -0700 (PDT)
X-Received: by 2002:a05:6122:c2da:10b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ec23230f38mr3698435e0c.3.1793106269536;
        Tue, 27 Oct 2026 06:04:29 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a894d5sm2072671e87.50.2026.10.27.06.04.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 06:04:28 -0700 (PDT)
Message-ID: <08bc0714-4998-494b-baf5-bf1fed8a80f8@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 14:04:26 +0100
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
Subject: Re: [PATCH v4 2/2] interconnect: qcom: Add SM7250 interconnect
 provider driver
To: Ishu Brar <patches@brar.si>, djakov@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        konradybcio@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261027-icc-sm7250-v4-0-f9bdaa3c1c7b@brar.si>
 <010601a17d62222c-befdb9b3-ce1d-469d-a6d3-00511529579f-000000@ap-northeast-1.amazonses.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <010601a17d62222c-befdb9b3-ce1d-469d-a6d3-00511529579f-000000@ap-northeast-1.amazonses.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GYyCDgXL c=1 sm=1 tr=0 ts=6ae0a15e cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=rbLHc7TusOZuPl1584oA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: 5NyKvU0Y5DV2YyMuB8lJnIl5wEiCNUuK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MSBTYWx0ZWRfXwy0zsS8hVVrR
 MR1wQQ/OEbZ9c+gSPdD1D11U14oqlTiNLDJ3BS3pPdAs2+6ZgRJJGs1McjvTqrhow8ADOjhKkZt
 GyRPwlifoZE4G/HIgZlx7KiQgXxuhADRWZ2dXCFdyEvUkQavoMQi7p6UOAwIFhqY5uDppeLxIKn
 5dXw/DCc9C8+nnILp0r/Fkaz1HwBUucTVwlZTSksyLbPv/7/VCkBEyZHVW0ZKxzyRSjGcWXGIe7
 KzTwlk37FUho8BVdb3+7nS+l5TZ1uK2Uc0seRCPq2ZhorGuwfgD3+0Bvzd0Q2mh9Bub0ew/869k
 2MtWvRrmuoCxML4OOVl+/dLCLlRLvvJ6eACGAAh453pAtCIc05Y+lnAOoNOVDzItkLGeSt/p4z1
 x1IqsRGGYVHBfToff+Ge96pvbIMS5r2HirfQML6pAUrJGEBsVKvIGP34kkO5cIGvcaN8+eA3GwT
 r3aGUtxqgR/EAxpV7UA==
X-Proofpoint-GUID: 5NyKvU0Y5DV2YyMuB8lJnIl5wEiCNUuK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MSBTYWx0ZWRfX42JymNpJAJov
 0rhPFa/aPtjOps5dInTrdZFx+6Qe1J/z/W3inK7V5HOGj+pICwiQhTwLaO4F1xhTB1I2cx16En2
 OsYyp8bkvWr9bRoChbciXfZJQ25/zKY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270051

On 10/27/26 1:42 PM, Ishu Brar wrote:
> Add a driver for the Network-On-Chip interconnect providers of the
> Qualcomm SM7250 SoC (Snapdragon 765/765G/768G). It follows the layout of
> the other RPMh based providers: the nodes and the Bus Clock Managers
> come from the downstream interconnect description of the platform.
> 
> Tested on a OnePlus Nord: all providers probe, and the UFS, USB,
> display, I2C, serial and camera ISP devices get their paths without
> errors.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
