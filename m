Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D03308F0A
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 22:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775256390; cv=none; b=WNE1zRT5IexY3XQVXH5LfFtLwIVHRPjKXeUo/7gB35FoDdL5IwrOzo7ncvdPKl/1AkoFeDrvCCOjVvwxWEEa+6MQT/dn3UxCxo7q9LSDysFx+V5LTUql8SulqfGY8iBtQkGlIWs/IpLwLjBkOjA1HHZfxDO99LFxJWGITjlsWIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775256390; c=relaxed/simple;
	bh=ZUZX9u7faTLUdSbiTG7COPkxbBLbnN2HOrjOhvY2uH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AueVHYzBthcFK9bfy6U3SvAsHdJya/Jf/EmepgCXDKUKYIG1zBV9SgTAE7daIwvzKYUupC2rHVV7lU5xq3/Xxz8nwDbRURvxOdinnkyPxtDP+ZfxhxlWg6kfqrP9nNnYS6z6Gqf3QJv5h7OHSQK205tMbXrQuSyJXWizoHNtIx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZMx5Nrhs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JDsPMCcn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZMx5Nrhs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JDsPMCcn"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633JmEpT918280
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 22:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zv9vOkJ9P1gIHigUvKKjrH3M
	x5Ul7I4ediYEdltY4KU=; b=ZMx5Nrhs8cahlUxZ1JG96IFj4/rPBGHhcUxtjRos
	auBcmEVl1kWmOlkm5f/m+EigdLL1hD2CFGoc6N8FsKYDmWj8I57lr9jAZhtEHYjU
	TV8J9Ji98H7+577UmV219YvQmjmH0mnYcUIMtgaKfV3wmxjVKB4QP5ndnfT1BWUv
	ufrq7CsByRdenfHkUz+APlgncHCECjmos9POdNxmHNhT8LuSoLMH5xSKKx60OOfe
	U2oR5TpuDZyA3kBCPHhnRKVV1oc3Ql0+Hx9kvbM3wwxRF+LExUhEIeVPArkFhKFd
	M4p4CGCSqjp1bRx0jxCYfzImhvlAV6tFaCGJwSSC3uTZXA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dam160c6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 22:46:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4661881eso28263021cf.0
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 15:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775256388; x=1775861188; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zv9vOkJ9P1gIHigUvKKjrH3Mx5Ul7I4ediYEdltY4KU=;
        b=JDsPMCcnNkXrE9cfEexlwHrKn7+PFoH+Wwk79yoYCvxBF6QCSf1AZdcBCFBZKDhuS+
         hrv8I5/+DNvttpgDKWiC0KmEMlQPnPktTvoVuqr7GAUUR6erp2DIkx1DwrSUl3BW6ncZ
         nTjSow4bNGErdkNP9bXVPy5KIzlB5deSNSPulAg+g3LAgW9ANyLJtPBFwUEf3r9DOvak
         uEwWbfE/ODQMk+PaEwx/x0wPejp4HHZzyIbX2tOxfT2WnTKXN6yqDvdowAdqfdnmu6bQ
         umQeaCaVsHE81QulfNIgRML6MNw/OCcvENNh9Wi7BZd8Nkzc4IYxfOG8WX0ce0Hx6iZJ
         GkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775256388; x=1775861188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zv9vOkJ9P1gIHigUvKKjrH3Mx5Ul7I4ediYEdltY4KU=;
        b=fvTGrvdvQI/LpSBSt5ZZlH2kikWLrr6DsN5e2v1FrGpWyB9S7XNJWLk6DIjvYuI323
         0X1qsjxnmxvAi2Xv4102na51bPfunV93bBY2TPB+QUvh2N/XXVzvUosnd1Yuyr084Rfp
         Sn12q8C0fFfzdE4ZIXXzodNh46oRbqyhoisEuN9MDWNFKNEuHD4qYhEtfW7iKLFmSyTg
         vzvibihkFhIh1iAwZNO7LvfzWry4O1/XSR7CKdwEzvAwrt2WFA5ZLDRS4oaJ800ZLDN5
         4I4gbZT4BRjDa6PpMZgr4TVpb8Emd4XHHdbtoxdiCK3nyuEF9abP91pXKoM5HFlYu5r9
         prkw==
X-Forwarded-Encrypted: i=1; AJvYcCW4cw5I7zAp0l9P2bDv+9eIB3fIm1nUsCv2LETJIaQ0SCB8V+QtG3qe58o7EU7l3Xwm+1KGL9uJScUK@vger.kernel.org
X-Gm-Message-State: AOJu0YznTnp9udL33e6zzQyqeBKj5OF51V9ClZil4DnkA8HHtCkzYuUx
	8hQdwPTJkMXmc1PSpGKqWT5e+2m2QDESCEum4wPv+gb/bUlSBNKXGAnlecQe4pismkQgRX+RiFV
	8zzlEb7mCpwXPbO1/+xF9O5kqz4Ell/hnwEhRWWj4aigSo+lWghC0F5lrB3Y23FZI
X-Gm-Gg: AeBDieuBobSILWB/GDMdLsvLo7qu2uuAjinJqfI6iUrSBuUa8jpIr9miiYRdwjgFQkW
	QPL0DIozC/itM55ouO2EYOC9iCzLR40lQzWGhXoQWKJjsPlpn6WSXBZdVLcyyL6cBMocTWJU86L
	+35I9Xo5t7+jgdjWd1d40iIQgRSQ4Lgnl4ltxyetQ+s1asF4r1I1LW04/hEpH62zkixK99Jh3zh
	iFO9GcHzDKUI2YQsa3V8zOJX9ov3fBx33wPvEu2ecBx3c8ddzxcVNLSbJ8g37K1DRECkyFK/VWo
	IMM3chIphThfxRVFgmiMzttN1YLRKyzgBnHn/chF5Ftc4EQpspGY3obJJedFh0r+9Z11lvFd3Q0
	OjJVMkO5YRK1xOFstHxZ9JykcjupJ4qsAG1Dfn4nLRUk4HgKfGMEEh9suCcD+VI7ZyNJQoKGW7S
	/1qisH0rGvGpzKGOoiIzyrENWVIIdpeIqKnQ0=
X-Received: by 2002:ac8:6147:0:20b0:50b:893f:7d93 with SMTP id d75a77b69052e-50d627725e2mr57220511cf.2.1775256388049;
        Fri, 03 Apr 2026 15:46:28 -0700 (PDT)
X-Received: by 2002:ac8:6147:0:20b0:50b:893f:7d93 with SMTP id d75a77b69052e-50d627725e2mr57220311cf.2.1775256387582;
        Fri, 03 Apr 2026 15:46:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9534asm1717811e87.9.2026.04.03.15.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 15:46:24 -0700 (PDT)
Date: Sat, 4 Apr 2026 01:46:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 0/6] media: iris: enable SM8350 and SC8280XP support
Message-ID: <kg2sflnuslexbch5lycyl3n2ry72lfagqvtjald5qo4j5jeql3@tryqo6th2wzy>
References: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
 <c7094fbc-deb7-4d76-ad97-9c56b81c7a71@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7094fbc-deb7-4d76-ad97-9c56b81c7a71@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Kr5AGGWN c=1 sm=1 tr=0 ts=69d04345 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=F3jmmAGWxxlI1FSMdasA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDIwNCBTYWx0ZWRfXwKNWRYx2Fd/+
 Ebht5SxYKaiRB3oRmlRSiZ69B0n5DE3xSe4wThsoCEq5ds0ZVYRWyvAKUlwX1NY1GciZMrxqZAD
 0Nm02R9ez8oeh4OxJBXI3tLCSfmuH29wlPDGVsCyYm7y//48P4caTg5JiyZBbQm3144UoxB9pmh
 GznHKbnj8Hb34dNyTBgd7+x63qQcex8e4sFZ+L/aqIm+lYc4ym10aizp1Ehs0Fn43epQFuRZ0mP
 zZEC3q4h2vDzvvv+yY7VHjSYYw5N17pKKxFPw5GjhBFhpYbjOJzjleeB1bXPF/FqyRXZnVFbyHN
 o9sRuqEuPi4ttzzteU7NlQveCncLPcaIHJ8DP/h2+B63uK8+xmvN7sizLGKaL0UAa6fgvDd66V6
 CIW1iDAJNbbXotuwgPVj1lOOuA91xFQoi1iai5mlGln14B1GK+rP210ttFZU5fhzfvR5aMGh8JE
 F/A4UJQON/AppuFkRJg==
X-Proofpoint-GUID: fRVswRe2lqXAy9vmpqgMlGKpC9BS6mcJ
X-Proofpoint-ORIG-GUID: fRVswRe2lqXAy9vmpqgMlGKpC9BS6mcJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030204

On Fri, Apr 03, 2026 at 12:51:30AM +0530, Vikash Garodia wrote:
> 
> On 3/12/2026 8:44 PM, Dmitry Baryshkov wrote:
> > In order to enable wider testing of the Iris driver on the HFI Gen1
> > platforms enable support for Qualcomm SM8350 and SC8280XP platforms.
> > 
> > Note, this has been tested only with the Iris driver. Venus driver fails
> > to boot the Iris core on SM8350 pointing out the UC_REGION error.
> > 
> > Note, the firmware for SM8250 isn't compatible with SM8350 (nor with
> > SC8280XP). Please use corresponding firmware, extracted from the Windows
> > / Android data.
> > 
> > On SM8350 with the Iris driver:
> > 
> 
> could you list the failing cases and compare the result with sm8250 ?

Failing on SM8350, but not on SM8250 (note, on SM8350 they also work
with FFmpeg, but fail with Gstreamer).

- AMP_E_Hisilicon_3
- AMP_F_Hisilicon_3
- DELTAQP_A_BRCM_4
- SAODBLK_A_MainConcept_4
- TILES_A_Cisco_2
- VPSSPSPPS_A_MainConcept_1 (this one timeouts with ffmpeg on both
  SM8250 and SM 8350 and fails with Gstreamer on SM8350)

- vp90-2-14-resize-10frames-fp-tiles-8-4-2-1.webm
- vp90-2-14-resize-fp-tiles-8-16.webm
- vp90-2-22-svc_1280x720_1.webm (works with ffmpeg, fails with
  Gstreamer)


-- 
With best wishes
Dmitry
