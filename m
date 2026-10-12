Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B294A6CE5
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820320; cv=none; b=geERPZat21sYbErrbbL4fL7hpli6TmmNgRYPTS0cqrezz8tIR88cvOqQDU8OIMc47pMPnN2AIBS5TKsFOdWwT36HRy7krVUEMg/FYEhXUaZ3gOQ9sGV0M0foZNmyQeZHHOfrDfol+FcPFRPJWBXNcMuFX3x/69zNt2zb5cJb0bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820320; c=relaxed/simple;
	bh=Elu2DUvxB4cGcjtKZawr81rvYGJthLEYsYyNE8ZKy7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cgvXbjGHWpCQQbiRo8XL0cNtiii9YZ38Dku0kQzwf1IVFPzmFclinvnYfhC/KluJPlh79BurQlgo3fbKvM71H8wBQQePAawaq+ijNiKHEqgVt+T4XluXdiWMKYL6i1x2sW3HdMNm5JWImEFtB7dJyTXXImm5H7ojJrErymtXBrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qx4i6RZ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCNx92bt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qx4i6RZ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RCNx92bt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFejAO3782536
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xELYLGb0jnmIxIf4Qmyj9hiIBGQ7G+MrqGgWqyJ++Mo=; b=Qx4i6RZ79HWZOYdy
	R0MOhv+NPqSqbKq2UbrjXzyI9yIFQxS7UNB8jKDHLTdSqtz6+7hIO4Ud3UYwexWh
	ONG9kcwEgPjsE21CdqgWa7fbPLxugDYsXFx8DsXCP+Heu2pb4FEAGdcUhpnp7QfK
	ZHU6vhNJQlHZ37cIs3KHtZxN0REvS9Fz2YX99zq35WA681VipiUbJXnHXcw45Lv7
	ggOcQOFwsBl5rH1xNBPX+WTyv9tMC+KAOc0gaRJ2L35eqVqSPIdeHmKcPibPg0Pj
	7Gzfg2FqbhoMgDgEEC9ls/CrXrSgcqB2UGUhtJHK8AMziIgsTDvWW8njtgAIGCRU
	GPnwDg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3j5ee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:51:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc50fb0d2so30797085a.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820318; x=1792425118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xELYLGb0jnmIxIf4Qmyj9hiIBGQ7G+MrqGgWqyJ++Mo=;
        b=RCNx92btv+oB75KQXM/rQZ9e558heBoE2PNh2T8t0heSGC3RPn+/dTsnhwlfI2qGzP
         vpKeF48OnfKqDFuj0seohoxrxzLdE3y1rdxS40cN9dsAKplhGRDu+HE4CE32rcCE+oH/
         QuP6q5odVdCecGsM14Zv3bUbxQCm6VcMioQx/JWyFzfYQBe8KjvOj/l5RZKfZH0CVAVy
         VS97J2m90MoiUVXfTfBkwzy/vnGrdhw9MNqF0Mrh0iUr8TZroQPK0AlJ8vAgev3VH4yh
         nIkni3sCmzFNA7eo/rftBVN7jbR/7BqBRXIzY4kx8hzKUxmsvqmJytmob9oQEf1WiadT
         Btyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820318; x=1792425118;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xELYLGb0jnmIxIf4Qmyj9hiIBGQ7G+MrqGgWqyJ++Mo=;
        b=YGPNQTUMWIv9jeWhIJzC/0Lqf60tYJ4pAPURwc3bqFmnHRUSgb0noDGp54mbqh+wI0
         dV26BZ+NPcazmPAlwOlgLcr2CB68bxAAWSOLNT065D8WKf2yKjuOwLPyFzsGogxSv96n
         4LGzH8AoRa/tJcV0/QmYQbGTPvFKiQmstmsg0ARrTqtWos3/hgli/LVjIQIf7Xrt3X8d
         aZ5PNI6f8GkZfrsnEb7Fpk1knElBU9H9pnP4oMCWzhliVUds9F6TdEMWaO5yEp2FgSzj
         3y8aUJWSzs4+K+Vt8Oly7Y16mIhirmL1K5xpfqiFwmJTEoATN9wYbiAddWyPHjzn5cu5
         b+UQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjmUa1vZtFzd05EIt8FV4EUu+7ynqbxU1ppi2pFaM6j4nr0Ep4ul4wxiZY4/P/Mxm2pidQRgu4eCYb@vger.kernel.org
X-Gm-Message-State: AFq9FYLP9/FpE6G8V6Mlz8rkwO4c9IQQnSN4hYvksm7Qzt2IhoHiC/aA
	VPHxgQstL+o71I4SMiLkjCsbCOiBfRQ9oxasZXvT8cw49nC7TjRUOHA8AzjB7AymbLJF6OIzTjj
	4ndOyBKiaMOTW378LvMXXGxUbjRjRB1upzT/8ELg3T46/uPGMKEuCm1pjJXsO/mae
X-Gm-Gg: AYBFou24ucnf+Apk0YQ7X/mnHn1KCE3DL/XnLFlH+tA/Ksk+rjMY596dneYkaxYpA1Z
	Cwz3fRv69fdzE17+GgjpdWGHYaIzrioznkyKrDDWS1KdGFn+kw5ss5vrjid2nexzVpXUaHZ8hJY
	7U8dcloosZp01PnwbyTaZLGMrmO/A7RVpnSivgJqFrnPVtjboDRVW6UkCtx2H7qSYZizo5oMlzX
	rRVvsG4EeTOJErvfkT3g3vxSdC2AhnT/bTaYn4u7NuadQKSCwF3D2sWoCgDzk0XdRDnxBjI/gAH
	iPmQ9qvKwFgb+6y185IT0g837cUjsdSXMTRyDNSDytd5tB2Y4V14Etq9jujKFoMy2nh/GjELIrJ
	SNT7o7BTkXhMt/fMbJGVPhQ==
X-Received: by 2002:a05:620a:1a17:b0:93e:70cd:e420 with SMTP id af79cd13be357-93ebd2605bdmr1907370585a.5.1791820317784;
        Mon, 12 Oct 2026 08:51:57 -0700 (PDT)
X-Received: by 2002:a05:620a:1a17:b0:93e:70cd:e420 with SMTP id af79cd13be357-93ebd2605bdmr1907366485a.5.1791820317315;
        Mon, 12 Oct 2026 08:51:57 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3498276daasm160389366b.51.2026.10.12.08.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:51:56 -0700 (PDT)
Message-ID: <bbe1ca16-4f1d-44d9-a354-3319f3644d14@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:51:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 36/38] arm: dts: qcom: sdx55: Properly indent subnode
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <1a3594753ee5f823f9de863dad39bb508603860d.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1a3594753ee5f823f9de863dad39bb508603860d.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX/dimDpKfY4zw
 TNwq3wp0r5KWchhbkXCGNzT1yZqwZHIOn/iQJhQw8oXdbT/0n0i93dvxUq8sWZLfXHXvHrKTjNt
 8VYX0l2c0OgCVWjXGiR26mGUOne6e0CXxXYTpkuBrqMddyimEPQb8hITP3He/scPWHha+kGVYqd
 aREPjrNQtNih64j/nZaHU2kg5KYKkNHrU39epfTq7Cj+VV/XHB3eekSXemWIliXp4jIA+WhryvM
 P5paN/kgT+9TkK5ZJoelkMWEtwcqVOk4Gpc2ahuuIwpmNyYMA73CzcmLAxsNLJhMt+Ndp5RovkO
 VXwx/UVSe8vmIY97TPOuPObDHv0ikmdzW7CiO/1szwNQ9k+Y1hU0GybDmsMkj/opl5HA/qsevAb
 /QGrPIoL7YbYmy+DKJ3t8KAwWomghatGuCjUfx80tFXanL4O6pECOe0wE4vrVPCFb/YRAIqoBET
 aqAvf+FCvwaWiX+U9SA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX85I823A4IXu6
 H/19TM82a3QxKqoAKHL8fcQwwQexcXIzJYvMlxXMhYFshmHHzZLBOLdn0Dc1eyl6o5j/QYARi5l
 EnKZwEG4t57Cdiezfa45Cc9u4nYClpE=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6acd021e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: JvPsLMnjSsOUCfkAojUz1XBLEFId6tvi
X-Proofpoint-GUID: JvPsLMnjSsOUCfkAojUz1XBLEFId6tvi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120063

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Subnodes should be indented with tabs only. Found/fixed with
> dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
