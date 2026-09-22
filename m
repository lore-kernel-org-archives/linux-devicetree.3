Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1886F47F3C3
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790100624; cv=none; b=I5pEv+WK6LbF1uQfZuj1QpHNvNYh18mrP9pxcC6x6X3D+V/KTN5LAIDHCK/aInrxdfEm20i2Si+zRn5687AEGx9mf6fyku980FbaBwveix2iXBL0GjvE3kwxUoOw/b73qB2ZzZGv0q/g/av7zyBZhIOJYUiku1N/3LzxPN4E2Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790100624; c=relaxed/simple;
	bh=Lhqa5FPuJI/7ZwHwFoc5BJR+w4pkCdSYjJUWN29IEeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=na8VXiHxpSzA2LKklKa/3VT+Xg9Qu6gMsMMfmVuq0b/0el4FNn9sjY9eHs8tBEipb6HQONHCjFH66qX56B7hQ+/T6o45cEmExD90ZyvvZb9SpaRnAIxMdwlwI2oVAooVoCFBQWv2L8kC7XY7Vt/c8lyw/sBh+B1wZkvYGMBYWMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XFYlyaf7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PTepgQyr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XFYlyaf7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PTepgQyr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI6rNe178647
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cMGKbEn4nCSVnNp4HH/7UejWSUwgcuvmnhDSDi2jIhg=; b=XFYlyaf717HVkhsH
	x/3xzhnZ591xx/EVvHKtXKpI9L+0t46d6c21gZ1K5QucT95MNcJ5cRR746X8XctU
	Mok2bflXxqBsMLYrE0lw88JSiGXhL1pyPEzYYjrUAoU3tZTqfwHxW6SfYdgBc3zP
	pbGSUU/zsY7Nkw/z2Rsv8Go65VUw0Pguxo2Ee+Tq1bzpAQp13ta+ERJQXMoNWZEP
	h/RlRcUUQyugbTiZVvam6M237EXum+CzYK7RY0rsI4HOjPALDl5Lh4N3srgj8e9P
	v1ZqcYJNNTuSpIftuVrJctUBrmi12inSokzidqbIJP2FNGrZPSao6ZU5cDkxCIDO
	FdGuLw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guuec1789-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:10:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3286d2bac04so62242eec.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 11:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790100622; x=1790705422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cMGKbEn4nCSVnNp4HH/7UejWSUwgcuvmnhDSDi2jIhg=;
        b=PTepgQyrT+shAKZtW7HfZLAQgQeQyqvhRxK303mFDvKJ8w94rL3JeEEbb/TsGbysRK
         MXD9vkJaazIA5p3+SOQkh1XdOraAkIpVoV0womJ35tN6ZbP3QOudvrLzcdHqiVY4Dgbb
         r82RJPPV5dDPmvnHa7W//QxwwrE4sfxo+0ImElb6Mn62nN74d7oC9Rm913NcCmxMP9T2
         VQHv8enEAsSW2KDk+oQiBjhRvVUwIA85FoMX4iJXjusrnLVdMokoO9yGMc+GlGQmzP90
         WLJIVApfHmDuNsNszqYTHgSt4QeSjZ09H6RejES0AU7Y3yad8YXajkshljVX8OXuD8dL
         Lv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790100622; x=1790705422;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cMGKbEn4nCSVnNp4HH/7UejWSUwgcuvmnhDSDi2jIhg=;
        b=OJKOuV0poGS3bGBTtL5nkfmrXOHRwYqn+ClSLvChFuE5DDFfHcdfwXPExY5CpL9AWX
         XxlT6zvkt8K0ExgE2XEKBfmmpr+bjKdpXZCN5Cra/7bGYefD1IKrQwRDt5l50qLXmx0U
         klT6JxlLePvH9HrVY4mpwgByGAy/epq06QtvQ3xZ6AKEeteh+3ntwSc/ihe5nZCuOfYW
         Tqy7q4YPRNswHx1kB553amMGG+FPW/UabITDSOTnz6CttuIGlhBH6mhpi27hZ7BfC2/9
         G7m8WIp+ElRe7oapWzFUe01T2RUE19x1nsQI9m299UaqbtvpkA0YYuSoGEwfluD+Dkt8
         qYoA==
X-Forwarded-Encrypted: i=1; AKwUvBxp8ql8sZYY+d5Tv+rhUiy18nkWt4qX2r3Pc5rz0/ASoiMX+sfLXZCW/AYnQ5bBpEgsy6DnIsiWcqaL@vger.kernel.org
X-Gm-Message-State: AFuF++mBkoOBZSTb4i7gXFEB2a3tRqQ++DT+LR5k666o9mjxLqcou1hb
	u8VgwljyK3KNCTsAzi4zxjKbqtQnafv/wtiLKKGd/b9Uvo4ykgs3PPIAOwPyGBtLDwAGNawLhHR
	s4RaDoc3jQ43vXPdKvqDNjYemo8lnTR5WhC+q8XHCkZrHWgD3ntpFZ8g6qjhlsNXt
X-Gm-Gg: AYBFou3EtSnhJdvRqYfTPiAH1xLs1QGLIgJ72zhQxYXN+gRjLVHUVyFtYngBVT/107p
	mPF87Uwt1Z7GMnCK1r+B0OBBxPaGTuhJuM5STSCbwgNDlMm9jKUrJkPM2Yw9q/sMTrNrGDFKWOr
	/i9QgslCo2sbCXKhYW+/7fINS0jxzZRvkj/UGxsk6YlzDtWZf35w1unki4PmZIIIt5iYCLBRO/Z
	aPqBAvfQEk98a7yU+DUnND2Zb/KLM1vxqAgzDVPB0CR5hA6HijDqrwY4mCUTGGpYsulS71EUB5V
	X9phZjddWioUhbcBZuGUWFD1ZOnM01Ctz6VgvFCkrrb4hg97SLnVjWuwBIemgzWy5Ys1tiv1T60
	qypZEJk/veSH55Gku3upZ4lIaeenglX7GaA==
X-Received: by 2002:a05:693c:60cd:b0:334:6c90:61bb with SMTP id 5a478bee46e88-33e8e1b1b66mr132178eec.28.1790100621393;
        Tue, 22 Sep 2026 11:10:21 -0700 (PDT)
X-Received: by 2002:a05:693c:60cd:b0:334:6c90:61bb with SMTP id 5a478bee46e88-33e8e1b1b66mr132120eec.28.1790100620512;
        Tue, 22 Sep 2026 11:10:20 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.143.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7c63bsm12881eec.10.2026.09.22.11.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 11:10:20 -0700 (PDT)
Message-ID: <3e4dbdc6-692d-4caa-8f60-f0d82e894141@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 23:40:10 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 5/9] media: iris: Handle CPU_CS_SCIACMDARG3 register
 write via program bootup registers hook
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
 <20260917-glymur-v11-5-e0c8bc914742@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260917-glymur-v11-5-e0c8bc914742@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI2NSBTYWx0ZWRfX+3iLUbvNKDsC
 KHCfiWSxaf7EwXErpU7hcEcPIhOfeTRGacKimHDdxZoCW0KHDFCCsIPb+hIuZhLp6DWfSa9ZYUJ
 ZlTdZF7l6AT6rh5J+cOiDyZWCqxOFC8e98PLDt+X5lHhqav1bBz/ZTKvbKbDKDxRWTCGBnxN4im
 Rw3dKA4blfzzTQna55Wi5fWdexmdfYrZuFJXyj45chbkX0z4x5sLlF7UsS2eiMATDIInaZqe7Sr
 SapvJKtTS7/4JrN5wzQHMIT+X1wKohsDOyNc2jND4XC9XwYRCvAFU45GO/KnxeEJ+gLgo2h7J0O
 HdAcyEdjOcLh0eDkJnXazkSMyQGfuvZRRjrAdbrYWDMbYFNX0p6vlNu9OeW2qfi22H8ir95yTJY
 SP7BjmruD5zG4UJGA/5CgJX20jQUilx0cOberjPrA35jlJlx/x/2lJx2Pkus7F09adRAw78itmn
 u+XqSM6Rbo9tIYPZm5A==
X-Authority-Analysis: v=2.4 cv=VKdIDNPX c=1 sm=1 tr=0 ts=6ab2c48e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=d+GKXRUq2vCLDWIvqUj1TA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=bJ2oX7-cLgL2xx1Iw9EA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 9Shd1X0bKoToF4qRg6JNYWNGyDlepE9V
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI2NSBTYWx0ZWRfX0zARNB849/th
 F6h+qvjqQgjRJqysyMJz8NKVi4K8AVFbi7pGXNq+Bgpt3ggiFvYtDGlEiaduhrZONHyIiupKaL9
 oWNDPzA5cCkAQZkHlyLDY/4b9hgmUhA=
X-Proofpoint-ORIG-GUID: 9Shd1X0bKoToF4qRg6JNYWNGyDlepE9V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220265


On 9/17/2026 10:30 AM, Vishnu Reddy wrote:
> On the Glymur platform, the firmware reads CPU_CS_SCIACMDARG3 during boot
> to determine the VM count and increments it by 1. Writing the default 0x1
> causes the firmware to treat the VM count as 2. To avoid that write 0x0 to
> CPU_CS_SCIACMDARG3 as a Glymur platform specific.
> 
> Reviewed-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu3x.c                | 6 ++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.c           | 4 ++--
>   drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 +
>   3 files changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

