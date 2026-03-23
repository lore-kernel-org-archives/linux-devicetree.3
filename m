Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E7533FE15
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 13:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774271231; cv=none; b=IhTT94uoSloD6zf/15aAO7zmt9x471HCeH2F6257hB9dQDFSi6bu4BZkFD0DC+jJ9zoe/m0eaGlVkLxp6PVUnZcOfEGWYnXc6obEZ4BrffvJ7Gx5Iy+b2lBFypWHWFQD60U3cVgO8FSce+QqUFLtODzA/gvnbP8WpocxTryIh3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774271231; c=relaxed/simple;
	bh=TAF2ljkTXiglz3efmjh6vr50tf+tfSJMYlApalKamNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E8YtraYE1zWfgrjv9TjIJb8cllWwGQhv9oo9qM3BF8r0RTy2E8h1Md1T5vIqVr+nggXDtx2MIHqHcb0ziNEN+eLQvXWvcRqRGRRr6I14gKqSYiZ1z72hpqOE0SGe06pEfrMAvEAY36nD+4dNS5vccHlB/VBJMoYaSFqXXgggxvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jA6rNZgH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VG29yW4j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jA6rNZgH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VG29yW4j"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NCenR5949420
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 13:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8TJb/crNh19ZbmkUh+wMxqNSbzTaeQd+19UqER9KK30=; b=jA6rNZgHe1Wb3GaZ
	FmNAHX7DNv3zuu/hR4XfyvT/JUmJpn1VfwYnaH5Jnia/gWQR/UyAAVrWUizgql/w
	Aed5a7AAQ285z6/VYZNfmdjSWFaZ3yjRdXnjdBIkBBia7m5HEyJdFECsJwXmYY8y
	N3O7ofY8ybEEMwLnhlz8Rywx7ICNR1tTcaW8ODO2prZZeF9qQ7X9VG62CLOfs8La
	De8Rqp6lOliK+XDxgZpHO4YcfIq1Hnns7iRTtVN469sQRWpCj8u8jJvEFOcRi73b
	SwPUnLWiawiZ6u4x3ljACcsjJBdE4Ed74Bmo8/X3rubH3M9yg/wh+PjVmRWjbt0L
	6ztxuw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghdben-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 13:07:07 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56c9dc1e280so829886e0c.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 06:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774271227; x=1774876027; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8TJb/crNh19ZbmkUh+wMxqNSbzTaeQd+19UqER9KK30=;
        b=VG29yW4j18vGUf5obE3s+/yk5Uh8T1X2IjnUuegSzQ6cHfdA0khxdnak8vf9aXT18T
         nycC4AGhkSh/PTinR27yzs+LCpCy/9VkHSfvRJnbU5dnAU1vI8jFD7e54CRewoqVx7Z+
         PQOCFPm3L7DtM0m4x4yH6ifDI/kHaYxFZANPvLBaa64jORcFVmMdNJ1EzvwzrJF8qxRy
         n4BNkAqh0oJgYyixi1uMuKo/TTBfGzYRb0Qnr0dsuSo3ymKyyhjRQaWkoGzYK4ATekjr
         2dX6NqHFiefkUEEhBLCZrnA8YHR3/T6nOTh6VYvuR+mhyImKYoVcpzcB7z+sv4BbbvJ3
         gadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774271227; x=1774876027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8TJb/crNh19ZbmkUh+wMxqNSbzTaeQd+19UqER9KK30=;
        b=ZcKl4ZZdRz6bp0zFCArC3jT5MpXE0wB7M3KC/DuYxmb4XaP7S+TYsoY2tJQ1trBret
         WzKMeyeXyBLF2JXW/lwblHnklLu2myHUsK1Ja3W1xaPFG3Zb6tfU6uJzunwCGOZxiFHu
         KqBbz4UDx0UR5XpTCtC4IEwh+YHmbV+Kh7x0KIr9c/dEYIPmT5yRJRY2HAhJF2wzo0+Z
         NOiOD6V+qWfD9yKYoifAA3xFtbrGYYLRqms412M5sKHmhSYR3JvVtjJb5eMC9HO3cEst
         He2HKr8TDa1Gn0akStRuqFAyS9PP3dYfYq1KH91wR9aa7nurvNPnpunoveNTgiEmzGLH
         brvw==
X-Forwarded-Encrypted: i=1; AJvYcCVoP3l9j5Dk+KQDhEOdsIHc7iDLNdqZ488kq60l5yA1zObfLBMp9MtJJb/M2E38zl8U7n+6mLOI/yzK@vger.kernel.org
X-Gm-Message-State: AOJu0YxUfwUdoP6qlReF59n0WtSYtfIZaOLRsEQ/KC54XrioPAFLb0hn
	pIKGUycEK9+g+SK0PN0K0lbGnzW7bP1GViiqs8DJjNXyDBsmOrHhmTJACYe0z8ocTvlbLyRJEe+
	N8SZy1AruIhjvR2KgWgV+8cJGtmTEH1jdbmqBt502mGf+O3BUetq8TV6ukQP9Cw50
X-Gm-Gg: ATEYQzwtVzh4y+2VOixvkcJFy3R7VTx+HrVwjcRbE542wH8KlcXkzGkdhuOXDxX/l0c
	YQwvyusbvB2vhfVMfpynWzN3HdKYxoRCrFHfPTou/kDi2ModTnORM4dxrS50F1vDnUPZPEhtadB
	FID0hCsQoISbmfDJ4WHJvrSBhB8zy/+PV6Wno503bkOyofmD07JheeRMf4JqxGED9KDhvT/HQMi
	pg1HQgN92g3TCKKGw1K2+0G3ejrLy1SQ4sWEVSBpkFc7/kfBmZk1u90yTiC4mALsm9+gZ2230Rr
	0D3vmN5n1VgXmf3ye7PzDFmndTcp7i0QcHxR/a2UZGqCflQ6PFX+hKO7zm5w6WwzqahPUb/c7S4
	FX9HjiVWBf38WARyFyLolF4a71VGQ5MHKXTfk7Z5W/qY5JwSOUnknfBmzCcpGY3lxpZ2Ac3pp/0
	43p8c=
X-Received: by 2002:ac5:c0cf:0:b0:56c:ce6a:90c7 with SMTP id 71dfb90a1353d-56cde437c76mr2292522e0c.3.1774271226540;
        Mon, 23 Mar 2026 06:07:06 -0700 (PDT)
X-Received: by 2002:ac5:c0cf:0:b0:56c:ce6a:90c7 with SMTP id 71dfb90a1353d-56cde437c76mr2292474e0c.3.1774271226008;
        Mon, 23 Mar 2026 06:07:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668d238edb7sm3897292a12.23.2026.03.23.06.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 06:07:04 -0700 (PDT)
Message-ID: <eeb9b49a-c879-46de-b272-30f601947d99@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:07:01 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: glymur: Tie up the CX power
 domain to GCC
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
References: <20260309-glymur-fix-gcc-cx-scaling-v2-0-d7a58a0a9ecb@oss.qualcomm.com>
 <20260309-glymur-fix-gcc-cx-scaling-v2-3-d7a58a0a9ecb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260309-glymur-fix-gcc-cx-scaling-v2-3-d7a58a0a9ecb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c13afb cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=OGlg79zl3ubmKLUECRcA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: uXydLXoH8n-RSIIUThTETV2ZafGBrGjB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMSBTYWx0ZWRfXyNO9ZHR+a/N8
 CmB0qqGCWJNfBhMBY4TmQCdcuqMcI6mAilzt7lfINZWEdwkVpvPsiyswYBO2ZjemY3BdjrffCye
 wa57jVH/1X1U7fFR5ktYu8Zl+6moOvVdi5r83BbaEnp7LZ1gkVhqrnCH6npViVpvNS+dj3Cw0ed
 vrCPiN7N3ICcDGqzSM59VEoRkTOSV963SXcO4tvttaMgmO04mos7ll/V9c2YhWFEjDHAGyzUjw0
 JM5Djt5iSnSVcfCuPjqEdpQWZ7nVVZiq+VCx9Je6tX+dKPmr6OST+NEPBfxl6T1N0nhmSsKzvbN
 +Vsf8TUNu3tans61YjXjwMNgyUZ/2QCHTAriclBlr/v8l2Kl2urheddX8QssYdug45skPJgt84m
 2fEK5rB2OalVYNrZZuBaej/iT+RYy/g/qu2sSuznI5cco3jJPspHE033nG8Ra77llwgqq2FGxZZ
 RyrpcOJ/sjz1xkBH9Og==
X-Proofpoint-GUID: uXydLXoH8n-RSIIUThTETV2ZafGBrGjB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230101

On 3/9/26 1:08 PM, Abel Vesa wrote:
> It has been concluded off-list that the Global Clock Controller needs to
> scale the RPMh CX power domain, otherwise some of the subsystems might
> crash or be unstable. So adding the RPMh CX power domain to the clock
> controller which will result in all GDSCs being parented by CX. This way,
> the vote from the consumers of each GDSC will trickle all the way to CX.
> 
> So add the power domain.
> 
> Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
