Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F4F38887B
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444033; cv=none; b=r/Uiov+dkABcI0vh+DShYOUQUjKNd13fB5AI9QC3xh30A2zDCrE4XNJeY/jQOynjnSIkthWpQtSA3zuvgxdT78Es8/+8wAoVUH43ccB6ueRZfOKKD+QXtZbYAVd1jqQqhYtyOvhCfUUBAha6lfYgaFMYD5LhmflG+Kgy4YMMZWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444033; c=relaxed/simple;
	bh=7qjC8VTwLSIWUxIcPNC78Avu+AQuxyoIPjdlqavAsrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WmI/63ReQ507xrZchfdQ2QPTRxSZ7Wvf7JIwnIYBCdEfXy6mJrzk36/EdYmKkPGelvx8+Pr6fwt9CMxJkysH76oDKKOyUAjvILi3lgaf39lfYEleFsBAMghGE3GNEqtjKlANmiljjX2abpWeUIoEpEaGh3v1zMZ+ObxKPQ6D4KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fc8XxbvI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TpmxsIa7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fc8XxbvI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TpmxsIa7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M6Y4oD1298124
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hzRbiXwHFgCyt298yD1cHbBlDAf+a4njhQqMUxBrv30=; b=Fc8XxbvIbrdf/vOk
	rR5aiEDXALEpD3J4pREEEREqmJQyD3HZvDwrdph3eK8mVDff3SnPjpU3syYn6vVR
	NdHQc5sKbHAcVeAO/GAYe+lOPpJ4/6M2FFR1lm+ncn+FjxbkUiOxCXiFbIu5IhsI
	dVvMoPmP6v78AJcutEvgdEoSpwnp9VSUMgpF2UNAGj5T4o4i1xMBUitU6JrOnAaV
	3AwFX/Eped/+ush+9sT63hoXAe0rESFImdcWRanzS4TmESuDvs+DAETwk/w8YHK8
	mSI8T/NTe1DQvYpoSpi5tj8K61B+RfB4dAPna+RIp4UXy4BqPjg2G07Clud4AUq0
	hXtLdQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eaah0adam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:00:31 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5751990b248so561364e0c.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 03:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444030; x=1780048830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hzRbiXwHFgCyt298yD1cHbBlDAf+a4njhQqMUxBrv30=;
        b=TpmxsIa77zwhasoJ+vM1s+4CoY3El3PsqVzB8nEMNWnuI7RGsaYgSaMVhWa+pRHTLg
         59qsGt1e6V13hjuA4SWiAlfZ8zu1Yxh1SAC1M41KeaRbrsvvvZiFKIAsKHUCa89rDIbZ
         luhtsGgS5ZG6w5bgo+D0DoOWj99BrAGFVO9HGUz9hKZ30V5UDa2k3SDhuuzpz1iRlPYL
         SO1k4QBGm37NGg6epuOOm5s//I2xN74Bo9HRQup+JI+obWs65DekeeyxXcgGEtm8mTXx
         n4De/G1jnxHVG3baSvmLF6n0PwhvBntmqoQ1ta9sTzGCmclUxZ5ySOoqty9IU3Mm1bhS
         9w2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444030; x=1780048830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hzRbiXwHFgCyt298yD1cHbBlDAf+a4njhQqMUxBrv30=;
        b=UgvEvDD2zDl++/IawNoU/AbGIIv5LY6qoGqUXd9AOSlB7RpxDjb/Wh0usCj6OKA4Ln
         uy7NiF9K6ZExw/JfSfEac73iLvb3uHPynPuESslwfM7sst8UnZDvh1PIfM2YNjb18j2n
         o2IcPV+S4z77iodc4MI4rz6BWjo1PBpfOMWBN7EP3yJub45kRYcHEmlEJTPVHIPJztVI
         n2Ep0SlTZYDEL/mykBSTnmjInAzfYMoFmojwN11P2LdU8xHLbDR+qPcOqjQi13zLIhX3
         if4O+pqGaQG8NxvQXISeZEG9VQcHXIzNqy4n0BrZHDv7kweD3ItJb88fxG+qCd0j3q4O
         1O/A==
X-Forwarded-Encrypted: i=1; AFNElJ/qledm5qMEGnEryQbyijdXXM7cOnLeRjrgrpdF2St7wJr/X84zMZTRm+3wG4jt6F11UGxoI5GynvRj@vger.kernel.org
X-Gm-Message-State: AOJu0YytVz1oSt07x2B7eGQTQ/A0VaBHd4AvAWJG8ZuoCaL+GlwBJPv3
	piXXgHggEUYKVpU0UkN+3uozcZ3iCVMK/wSRuJPm3hJ5suZJTIbzO9mundWzbzIo4CL/QXreUPz
	ZICkvdAScWeywSL4I+ao2otz6JUGlIs5/DzLbVvzJ8DP8Yc7faTywRqu7Bg8i+H57NJPZD+lV
X-Gm-Gg: Acq92OHSyAi87hTsFCZEMaL40+w6zBiuo+vvWAX7Zcr5Kwi0kBengvWdiNa/cOXhAiC
	BQac8OP158GS4lz7PfY0x4/YUmI/w8TcP/EuP23KOP+0NS4ktmrPu7KC/s0Kgn45fG6+x7vyklJ
	RC+WiCPzOYFBodI26GdWQsJPKwxbGP5rZaqrVSxGnZCt37jSZJRGa+7SWA7Kv2lsHCGsMOgrv5A
	nSv1aZ24LSdbecSLn/ommlXmt7OAXGNV38q/BdvJ9jinsc3y12KjtKsvKX/mmvF9REXY7DG5wKl
	PbhdiRgnyHej37saWBl5GwAPWKa9SFniMfTtau/G3tGSZ1OR0dlQeWKN+dEpjL1QDBu0C3KhE9T
	jyR63oofWekCBcN5n5p2dE5QTt+VWzDb/YkNI6DaFsMq8IA==
X-Received: by 2002:a05:6122:e22c:b0:56f:8cf9:33c8 with SMTP id 71dfb90a1353d-58662da92cfmr607607e0c.2.1779444030421;
        Fri, 22 May 2026 03:00:30 -0700 (PDT)
X-Received: by 2002:a05:6122:e22c:b0:56f:8cf9:33c8 with SMTP id 71dfb90a1353d-58662da92cfmr607603e0c.2.1779444030032;
        Fri, 22 May 2026 03:00:30 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cea749sm304920e87.50.2026.05.22.03.00.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 03:00:29 -0700 (PDT)
Message-ID: <77d63b5b-88a4-486c-9b0f-49be9d5c13d3@oss.qualcomm.com>
Date: Fri, 22 May 2026 12:00:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: glymur-crd: Add reset GPIO to touchscreen
 node
To: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com
References: <20260522-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v1-1-c7653924acdc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v1-1-c7653924acdc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5OSBTYWx0ZWRfX5i9muv4vh4Ls
 1apV7JxIepxbKgOvCObvFHAktfTN0eWsTPni+w7vAfl3R7y1CR/nS+F9st1BfRBfbe0mtpuMXJo
 LWMV1Vtx4F8lmtk6xhwxeGdYxN4Zcw6mKwZEsycSyBky0EF5pwlin9XvKz0DNB1plgoT43L5MpK
 eIbXhapDGUWFrxUj4HDimUxsry73idFLUNytqP7gNA+fjXxtezxF63JV5NJRgUHMnWMwaDYjAG8
 lOQjvMs5Fba5J/veOZm296QHu67nKdfvyqI76C7jk5NvnwZb1eyVEfWWPXskl7rf5X2t4q3/Tr/
 aO6HN8lBNPLeV8xp6Vdbh/P5PkBZZB/MO8ttLY//tnzimpwPnlDtH+x3sqp/dMLLJAW7fBwnOox
 xACTSTNTK1IugJlV1Sn4L+LYf9O1Ld4UVhNuvzMZIpw+85gfVKqBtZvwshLJQEDDASBfOeHrKA8
 +N3dxxFytDpzR3ucTDQ==
X-Proofpoint-GUID: fQ6fTuk7d6qCkXvrylD43Gswm9XE_NXv
X-Authority-Analysis: v=2.4 cv=LNdWhpW9 c=1 sm=1 tr=0 ts=6a10293f cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zwSULZKvJjN6iqXqTy4A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: fQ6fTuk7d6qCkXvrylD43Gswm9XE_NXv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220099

On 5/22/26 11:56 AM, Pradyot Kumar Nayak wrote:
> The touchscreen module on Glymur/Mahua CRDs is different from the one
> used on Hamoa CRDs and requires the reset-gpios to be wired to the device.
> Without this in place the reset line will remain permanently asserted
> during resume leaving the device offline and causing all I2C transactions
> to fail with -ENXIO.
> 
> Error Logs:
> i2c_hid_of 3-0038: failed to change power setting.
> i2c_hid_of 3-0038: PM: dpm_run_callback(): i2c_hid_core_pm_resume [i2c_hid] returns -6
> i2c_hid_of 3-0038: PM: failed to resume async: error -6
> 
> Add the reset GPIO so the driver can deassert the line on resume,
> restoring I2C communication with the device.
> 
> Fixes: e6bf559f7eb9 ("arm64: dts: qcom: glymur-crd: Enable keyboard, trackpad and touchscreen")
> Signed-off-by: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
