Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADF21C84AB
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783334026; cv=none; b=rIyVY4lV7Oc9kaXdX0a0/QYaFDg/mplFI7WGRxBdCSSIdGZRaJ9mMc/RiSS0co3n9Xng2VKCdrBxuhQfiZfyyAtbKpchBLCcxmay/0nqTmO/LOmq0GvMqZfeoNpD/ncnkfmRtGQyie0Lqe9dte2koQ5E6I/7R7i8wU6KHKIYVtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783334026; c=relaxed/simple;
	bh=OvJAY+33UpQmhMQA++lwMTSQLdFQ5zwlZWNAV3YowUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mpkuh7uDtaIxDuVQMvQ45e9cxazgUKy/lvDvGZTY6+jPtzXdeKqPJJpYFrjTdAnRZLyObbgUiNfEkEEwlmiJgCk7GhsuR1w34lCZ7BlG9FU1/TFllNhaLXOLRqQ++0paAJKzNJiRewM9rqgQdqajUdC5jbz7dsCN8pq5zJIqLgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LWd7iGqt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JkhyXvdk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LWd7iGqt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JkhyXvdk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669PlQH184095
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 10:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wKmnLti28rKW5MbWMbSFxzmp5Oz/FD7hTeYS02Q+QCk=; b=LWd7iGqtwoil4XS/
	OunbUFLO0NJh725OatDHeAMkxKovF/TOSfepDu5ASuLbCZMyOiCu3Q69ptrnNcS2
	Qdh5hjYnyUayiOFFp7IDJ1lwrFKBagd4YUDTeA8rroX+5mSrFZipq4M6bDeI4lha
	mbjlNs/Jzcveqm/gFQHWrvh0yMLeg1efmQ+856CNMr7595pu1sItZhLWmZHmcbRk
	k+5/wTr32BGlxzWsF1K4Y/8sSpDevTa7DYPW07wmw5gOsbr1gbmcgx+tRJFO96ez
	dW+0AgKtSOrxx0tFbFks4PWqV5Mi/kASFMh/yDhZUYw9e0SaNl0naaMF+YnuckmX
	p8w+iA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qpg8vh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:33:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c15c77619so6677861cf.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 03:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783334023; x=1783938823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wKmnLti28rKW5MbWMbSFxzmp5Oz/FD7hTeYS02Q+QCk=;
        b=JkhyXvdkqQL7C5V3dYfF+JZ9x+QjCfABZk3Z4r9sUIPAc8T2S2QWVFDWJOvq8b+7Ra
         IyE9Vdz6SHO8dqzkYsyqIIpVctyXGjJbUF/lNObmEpcf8TVRJApnouitTZK/rtklrJnZ
         dy2siEXOF97d7yEh1RZ+zJjtd4+e45raEIusbilFkOAnO+L5gBpu6rQp4cFjEN/rEIeB
         iTewRM+zf4AycxzeKjz2oPp8Jyn+CoVk4MdR2bTJrvaIUzhQ+eL6/bU0HLIoWzFtvbVC
         8Ak5AG7fJBJv9YMBnVmP4wfKvvE7Z77VXndW8v3vaBEjVCckuOlWhqhUJfos9GG1XJIz
         +CuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783334023; x=1783938823;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wKmnLti28rKW5MbWMbSFxzmp5Oz/FD7hTeYS02Q+QCk=;
        b=eHQRSfMjZGIWsJ5h5hk8D+NJZiMRCADyVcBMMu9XKFtPVkyKGFW7U0pQiIdfNcocLe
         abcHdtowxWjPuYRsMFbuSUWyytm0ebjA4FeQBPdCNKY2u2qoAnYb+oM3V6ylFsZ8X2+D
         QXV5TBGJtKBO0C9ZI2t84p/6mCYa2Tg+J9j80QUwLIr1uN0TmQyjRkDAG3iRMqv0Hd0K
         dUSMbm/vp7DLewi5OuNLqHWlT777gKsVPpZ9WX49/B9hsBusgkwgMYXpEpFn/zabu7/O
         Aw9FnT4EGLtJ2xImMks0LOyrTmOlQVrlcbEDXDXvyokeYkUFnpfR8aDdfayzMItsPYqp
         52tg==
X-Forwarded-Encrypted: i=1; AHgh+RrQusMH+HtAY2wNs3UZt8xWmj8+S7aPPlzipQH2h88na6vfZM5zdqLH9M5KyHlp0MVP7MhP1DwUR1cK@vger.kernel.org
X-Gm-Message-State: AOJu0YwOQkpcE92gsVI8zyds4uV/nCJrC2jezLkN+gf9wJuFRNBkgzBw
	RJRk9o8MhhaOdyFrqkzwOPGlC5gFbmGsIhMR78UT3hoJdlSJQ8VXsI08Dy4nhMtbk5NZf0JZmEd
	V4Aa+wVDvQZlqGoNGNtEe7Qx1U+CY16JDd70oZ3EEaKv9VWxNRL29I7PeOg8YW7Fu
X-Gm-Gg: AfdE7ckoGhPnpCtVQrW3JnMqN9VzW7GKUUu9vtNv7VtFeruEJz5IJ04Al8uwMzH4AYZ
	DSsF5bEJMxcrNeD/RFHQlqPrDULBOj9JSv17hEyQiItuSieNDJqkT11kFEpMSyBI/b0g8Let0Le
	7znG3dcycm5gpEGLZx9tDMBwq0wA1XqKBIeIRT4g9w/qM97R9bBvMheqF8lMxo3LMkC1E2XAeOO
	CrukAPQWnDuj8sPjlp6gb76/x9qN4hTG4qQNXQDpibjmFtk4KLZuTORXxsYcOcKRvZx0iVwno+j
	YhFWFqeyA/2ITsypOIuICKTe2sXf1qZ9aT89Jbui0awa4f9iTsycF+mfudtsU7mOn5LmOrSK8PY
	H3RZYyT+7ovyy9Eoaujbd3XQ0og6jxZKzEYI=
X-Received: by 2002:a05:622a:82:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c4be04aeemr81021001cf.5.1783334023043;
        Mon, 06 Jul 2026 03:33:43 -0700 (PDT)
X-Received: by 2002:a05:622a:82:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c4be04aeemr81020731cf.5.1783334022637;
        Mon, 06 Jul 2026 03:33:42 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a3652a02asm2764065a12.11.2026.07.06.03.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:33:41 -0700 (PDT)
Message-ID: <946b97b0-6e39-44b6-b27c-fba5b6f1c859@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 12:33:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] thermal: qcom: Add support for Qualcomm MBG
 thermal monitoring
To: Sachin Gupta <sachin.gupta@oss.qualcomm.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260706-spmi-mbg-driver-v2-0-f883ff1d8719@oss.qualcomm.com>
 <20260706-spmi-mbg-driver-v2-2-f883ff1d8719@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-spmi-mbg-driver-v2-2-f883ff1d8719@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4b8487 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=GuqtU1ANSuNXSekCfckA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: _qsYNd-RuSaQqTd1Gw_rjLEYZJwIyye-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNiBTYWx0ZWRfX0A3w3UM/7x4q
 NT1koMSlDWWrzLSCsin8iA5s1W6R6HmVpFHm/CtgUbRkWrSybC+6Vw+EvNAvFYm6/ODchwidHur
 /u71ZsCMgER9xGd7MeDEBAeNP3YJJN/Y6gncedvarMJ1EoJiv1zbmFpU179WPNgUfGrha+ZizzH
 33K0zNg3nBJWQSPxhT1rvt4uoOejU+6DTenYlUaD3pFSNg704wa0/rcHjA4JZj8CIOKEeXkofuE
 ypyAJ/sQvIkF3vFGzFQzLwKwRUoYA2o0v8OSo01FrK/5TENZySAkML+fUlbN/DIrVL4NGDt3kx2
 S0kvswhHUXbzvJM+Z9roof83qftT5eT1G4VE8IAwlRR94mefflU/NfpKpjVdLjjQVu24FClrKvu
 +etdStmtj8iWBz3xtFVm4FBd7vwU71JD0g/vXE1hc+dWpXKe1HaNR3KQ4NH1/En0bWTkkNDdpX9
 jVT/ehlJaP0kbnhZAzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNiBTYWx0ZWRfX4zh5nOK+Gaeg
 w1y4w9TyoOa2RCn5NVcVoBETYRKOSyrpFU0MtF9HltIiQEdbx3YyTTun2HrhAkIoLwsMj+h+DQm
 oK6CwynAgVJJZO3g5DZYt/ngJ5DjduE=
X-Proofpoint-GUID: _qsYNd-RuSaQqTd1Gw_rjLEYZJwIyye-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060106

On 7/6/26 10:14 AM, Sachin Gupta wrote:
> From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> 
> Add driver for the Qualcomm MBG thermal monitoring device. It monitors the
> die temperature, and when there is a level 1 upper threshold violation, it
> receives an interrupt over spmi. The driver reads the fault status
> register and notifies thermal accordingly.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> Co-developed-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
> Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
> ---

To the best of my ability:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Konrad

