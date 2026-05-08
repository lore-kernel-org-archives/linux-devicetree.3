Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18391F427C
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 10:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778237496; cv=none; b=AjJYK7DIXjNTPpkgTTjgXzVFBPYn6Bn5/peC78/NZ/TL5GVNcqVq31J493lgyr7kukpoXYNdyGXbujzqYG+clAS6p9EUV2mHgRvlEfErK026bUCmYHEnsvc23XfkRkvOhC1dpg2zGzGtnmO3n/YakSq2xYQHkRcOGtU5ljB0UCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778237496; c=relaxed/simple;
	bh=wwzccadeRcGMZJN90y1mlKGYEGJ/2kcQqUztPincb9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gbKpySy9pa3P4CHQ6ZU8AqissER+AWYMJ+MKoRXXa7/HJXJZbK/XSTKzyEGirCk9MpXHdRxdA/tcCpJQoKcqgk7jCQg/Xx7+d21ufeSxw7tH8U8tcazcLZKXg10/2boFEXRqFYvqfNIyOpLZORHieGyBPv2AhMgvcGy3CVmkB/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nFBJkwJE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iEwX4oID; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nFBJkwJE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iEwX4oID"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64853xPV2183388
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 10:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SnlbWhzc99BCHQfQV7HZ5qYLIwLn+451F/qKPNaplxY=; b=nFBJkwJEVHt9yIvg
	laLbd3aIiBw61/0B6YvlOjCe1XZA4/ab3Z2g7d3FGNaC/6dKkqpuAEpGgKm0Jt8M
	4yxYyIDckkpi81ZxMHJNuCuitteam2UVMmZ+0ZTmgH2Zx7RA+kgjb1W/XW3oiDzy
	myIXKuJRUtU/PY+AbK7rsPFkRv5r1QWk9+MWTdXZ6qr+x/5OLkBZ2SlyzVI60ucN
	Wah0ikU3EVeKV2FEVr9VQz37NKlVZ/8eryvb9yDpdFJct87tsDDTyLKRMba2kUhc
	yuC2HkAnnaJUnyYDhN4GAySxmV/m0IGuJf2PRymnHlXWcJ8Cf4r4kOGzc79uwexn
	aerUkA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10pyb0vu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 10:51:32 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9568c79b893so113228241.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 03:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778237492; x=1778842292; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SnlbWhzc99BCHQfQV7HZ5qYLIwLn+451F/qKPNaplxY=;
        b=iEwX4oIDF7HHJeXVxhkFCZbCDV0SQFa3iHie2wkI7vGTJqGyEPPvxdgQsGu+fj/0lY
         zsHZFiciB40F8MaLoOYF1GTA/8SaV5VRDzDFVKDEDuLaaYfwHUPA3Frze5qQ58s/5wXX
         TQCzXzzRC9dsIR36wZ/IrvWC/YcP2IKCV6nq79mCvnP3KKCOok8nLo+xxSgRqzSLIDev
         5eSkdjhen/Yr+Jiv8V89HbGhSJcqeIwb0b1ScZutqTOThSY4IG8v9DFrmYzcRi/Icymp
         Btw9qVUzenAqaD6kRP3O1HcB7X9cS4Mlb+/DCq06WuhXwD/8eyJvisaX8HmiclgcO8NT
         X2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778237492; x=1778842292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SnlbWhzc99BCHQfQV7HZ5qYLIwLn+451F/qKPNaplxY=;
        b=haJuGff0JzpME5HmwoZ9HTbRExPAO6A9yBV7vAhEfQx5HLX4YDOu1ZPXXQZn9BCpu9
         v9Ui7xo2XEZF6Wq+i6sK1g/2YsqQ/XEV1uZ6l8E4Cu119wi00jdBB7I9J/mof4DUdC8C
         0VXXCFJIAnSuXqr/HuNeTdO+bSlwzAI5hp+De66reI0Uz3DMENcFiA/A8qSjEVFffbV3
         nHOsmpfZ5YXrwsHlqf23V9qjI7uxJEgS2yIEEn5PbjXZTsVRzZ8I/x7GOyRNy5qQK/TL
         8NBnBLZRVlBCNuiOXpvo4Y12Cluq/vzn5lTiPMNsK1MOziryVZqjPtMIVg+ueM2oQ00g
         kZxw==
X-Forwarded-Encrypted: i=1; AFNElJ/isNFUZuxAud0g9KhQZ1B2ZRmit06NvDS+iY8+gDppgHhrzNlU38p3c/kBhU/V5IEjJomt0rnd0H2k@vger.kernel.org
X-Gm-Message-State: AOJu0YzuzVSLZkVyev/ap/L8Y9JWXf7UufKTNiQVm5sfgbIPxu/4+O5I
	emENra6yIeH1xhXu/kpD362vFOKnQfB+FS2NYGZVeYOaIkPaqGWo1sDMYpyG6J8b1xCL7kfBw/9
	eJUnA+B3h3Htoep7PupjqwsrvZb4OG34RT0GBakPMUuBG2ryNrOBlZtNk9j2ioKnC
X-Gm-Gg: Acq92OEpJGJQkxfFxoI8zjmuS/qBGdf31s3FbY+reHFFrToFrrDHTxAlKLQfkXYEQxC
	Z92pAhTwzf6uayU6g7dRn3Um+D3H2V6l1caLekzUP4Gp5awKZZv4U4FqXuywZ9p1Co7bChtK0PS
	Fv38nQIOXPURHNqiufdL387VuA39cpEqMYlZIKf2XSAxsgFLb9ZiSpaBRVWEJ1rDVMkkZdA8EgB
	SLXL3WkSsTjbSPgPbykQ3AStT3MYxh3nNtc+qB9FU6aVzCh/++cJtq6dl3tddZl75goYm4+1jH6
	sDypeACFFyVw50VzE+TElyiiycZomu/Kzn99AjTtHvyGFL4gFNYLHDvII92LVnUg+15qml0z3ly
	TttHMcX+90jRg17AU/sSUCDwujSnbkiQhaV80j5xSpfWd0mRuM9zMvgnQOW6AUUCzRPq6CjEJkW
	cmIPA=
X-Received: by 2002:a05:6102:3c0a:b0:602:b87a:3524 with SMTP id ada2fe7eead31-630f9096576mr1949296137.8.1778237491927;
        Fri, 08 May 2026 03:51:31 -0700 (PDT)
X-Received: by 2002:a05:6102:3c0a:b0:602:b87a:3524 with SMTP id ada2fe7eead31-630f9096576mr1949286137.8.1778237491514;
        Fri, 08 May 2026 03:51:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac0bce54csm66682466b.23.2026.05.08.03.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:51:30 -0700 (PDT)
Message-ID: <486b6e52-6211-41db-a92b-3b8022f53be4@oss.qualcomm.com>
Date: Fri, 8 May 2026 12:51:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] firmware: qcom: scm: use dev_err_probe() for dload
 address failure
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
 <20260507080727.3227367-3-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507080727.3227367-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DZUnbPtW c=1 sm=1 tr=0 ts=69fdc034 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Yh3SyrHHoMMxgxbEJ_AA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: nx_Nyo0m4CPZmJrCi1A5bK1tkrL4DI8y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExMSBTYWx0ZWRfX60IVDqy+ULF8
 QGV6au5k7vUoDCCvu2kj3lxy+7wogVco4wTboApGR8rfIpzt+0Vzdq9p2+4bR5C6NXD8xNjZOiz
 UzDt6nlHmF4pgf8W1P5NKyYaoixtBwc6iLxIMNpj+aAI0UQ3rh6w9JjUi/YSILEnjDuTJ1Qvwqb
 +OmvFnkmk4jRMc0vvJTxJuAaoq85VK16/hyPXSlOTuDaY38NXOhLJg9cZ8aIlYQay0nXVPY+KRi
 0grYYV3IXJkxw8C2BnN4xfze4CqbL7X4OtbxrBs6kIfFSGp9Rj8JEqbuiAP6cHjqvCm36tMQrLH
 bGy1oR1O0qU9JkcsBfVbBHwrR3ahzH1zAFMhO2qC9zYUB9hLK0c0WunrGztvJQD3uAUGX5A4MbM
 394E94oluCQZ1hgMk85CQT2aKdY3yV3St636BUmoOB4+RgfJbh2T4mzxXi0PXPyxEGN5gfSAH5E
 kS1mzA1Dt/tUyrN4Rfg==
X-Proofpoint-ORIG-GUID: nx_Nyo0m4CPZmJrCi1A5bK1tkrL4DI8y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080111

On 5/7/26 10:07 AM, Mukesh Ojha wrote:
> Replace the bare `return ret` after qcom_scm_find_dload_address() with
> dev_err_probe() to produce a consistent, deferred-probe-aware error
> message when the download-mode address cannot be resolved.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
